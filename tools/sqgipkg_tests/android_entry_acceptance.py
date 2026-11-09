#!/usr/bin/env python3
"""Validate native-entry startup, embedded SQGI, Activity recreation and shutdown."""
import argparse
import json
import os
from pathlib import Path
import re
import shlex
import subprocess
import time
import xml.etree.ElementTree as ET
import zipfile


def main():
    parser=argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--prefix',type=Path,required=True)
    parser.add_argument('--project',type=Path,required=True)
    parser.add_argument('--serial',required=True)
    parser.add_argument('--abi',choices=['x86_64','arm64-v8a'],required=True)
    parser.add_argument('--android-sdk',type=Path,default=Path.home()/'Android/Sdk')
    parser.add_argument('--artifact',type=Path)
    parser.add_argument('--expect-sqgi-version', help='Also verify the fixture system-report.json from this SQGI runtime')
    args=parser.parse_args(); root=args.project.resolve(); out=root/'acceptance'/args.abi;out.mkdir(parents=True,exist_ok=True)
    package=json.loads((root/'sqgipkg.json').read_text())['app_id']
    sdk=args.android_sdk; java=Path(os.environ['JAVA_HOME']); build_tools=sdk/'build-tools/35.0.0'
    adb=[str(sdk/'platform-tools/adb'),'-s',args.serial]
    env=dict(os.environ,PATH=str(java/'bin')+':'+str(args.prefix/'bin')+':/usr/bin:/bin')
    def call(argv,**kwargs):return subprocess.check_output(list(map(str,argv)),env=env,stderr=subprocess.PIPE,**kwargs)
    def shell(*argv):return call(adb+['shell',shlex.join(map(str,argv))]).decode().strip()
    def read(name):return json.loads(shell('run-as',package,'cat','files/'+name))
    def wait(predicate,timeout=30):
        deadline=time.monotonic()+timeout
        while time.monotonic()<deadline:
            try:
                value=predicate()
                if value:return value
            except (ValueError,subprocess.CalledProcessError):pass
            time.sleep(.25)
        raise RuntimeError('Native entry acceptance timed out')
    def cli(action,*options):
        result=call([args.prefix/'bin/sqgipkg',action,'--platform','android','--serial',args.serial,'--arch',args.abi,*options],cwd=root)
        (out/(action+'.log')).write_bytes(result)
    artifact=args.artifact.resolve() if args.artifact else root/'dist-android'/f'{package}-multi-debug.aab'
    cli('install','--artifact',str(artifact),'--no-android-download');cli('run')
    session=read('runtime/session.json');assert session['abi']==args.abi and session['entry_type']=='native'
    # install/run preserve private files. Wait for this process's report instead
    # of accepting the previous installation's shutdown report during startup.
    first=wait(lambda:(value if (value:=read('data/native-entry.json'))['pid']==session['pid'] else None))
    assert first['entries']==1 and first['value']==42 and not first['vm_closed'] and first['same_thread']
    system = None
    if args.expect_sqgi_version:
        system = read(session['source_path']+'/system-report.json')
        assert system['os']['name']=='android' and system['os']['id']=='android' and system['os']['family']=='unix'
        assert system['os']['version']==shell('getprop','ro.build.version.release')
        assert system['android']['api_level']==int(shell('getprop','ro.build.version.sdk'))
        assert system['android']['min_api_level']==json.loads((root/'sqgipkg.json').read_text())['platforms']['android']['min_sdk']
        assert system['android']['abi']==args.abi
        assert system['cpu']['arch']=={'x86_64':'x86_64','arm64-v8a':'aarch64'}[args.abi]
        assert system['runtime']['sqgi_version']==args.expect_sqgi_version
        assert not system['runtime']['jit'] and not system['runtime']['kernels']
        assert system['package']['packaged']
        assert system['paths']['tmp']==system['paths']['cache']
        assert system['paths']['home']==str(Path(system['paths']['config']).parent)
        assert system['package']['app_share']==system['paths']['app_share']
    tools=root/'instrumentation-build';tools.mkdir(exist_ok=True)
    java_source=Path(__file__).with_name('android_entry_project')/'instrumentation/Recreate.java'
    manifest=tools/'AndroidManifest.xml'
    manifest.write_text(f'<manifest xmlns:android="http://schemas.android.com/apk/res/android" package="{package}.test">'
        '<application android:testOnly="true" android:label="SQGI entry lifecycle test" />'
        f'<instrumentation android:name="org.sqgi.android.entrytest.Recreate" android:targetPackage="{package}" /></manifest>')
    classes=tools/'classes';classes.mkdir(exist_ok=True);dex=tools/'dex';dex.mkdir(exist_ok=True)
    android_jar=sdk/'platforms/android-35/android.jar'
    call([java/'bin/javac','--release','8','-cp',android_jar,'-d',classes,java_source])
    call([build_tools/'d8','--lib',android_jar,'--min-api','31','--output',dex,*classes.rglob('*.class')])
    unsigned=tools/'unsigned.apk';aligned=tools/'aligned.apk';signed=tools/'test.apk'
    call([build_tools/'aapt2','link','-o',unsigned,'--manifest',manifest,'-I',android_jar,'--min-sdk-version','31','--target-sdk-version','35'])
    with zipfile.ZipFile(unsigned,'a',compression=zipfile.ZIP_DEFLATED) as archive:archive.write(dex/'classes.dex','classes.dex')
    call([build_tools/'zipalign','-f','4',unsigned,aligned])
    env['SQGI_TEST_STORE_PASSWORD']='android'
    call([build_tools/'apksigner','sign','--ks',Path.home()/'.android/debug.keystore','--ks-key-alias','androiddebugkey',
          '--ks-pass','env:SQGI_TEST_STORE_PASSWORD','--key-pass','env:SQGI_TEST_STORE_PASSWORD','--out',signed,aligned])
    call(adb+['install','-r','-t',signed])
    shell('run-as',package,'rm','-f','files/data/activity-recreate.json')
    instrument=call(adb+['shell','am','instrument','--abi',args.abi,'-w',package+'.test/org.sqgi.android.entrytest.Recreate'],timeout=45)
    (out/'instrumentation.log').write_bytes(instrument)
    recreated=read('data/activity-recreate.json');assert recreated['passed'] and recreated['activity_recreated']
    cli('run')
    wait(lambda:read('data/native-entry.json')['ticks']>=2)
    remote='/data/local/tmp/sqgi-entry-ui.xml';shell('uiautomator','dump',remote)
    hierarchy=ET.fromstring(shell('cat',remote));shell('rm','-f',remote)
    contents=[n for n in hierarchy.iter('node') if n.get('package')==package and n.get('resource-id')=='android:id/content']
    assert len(contents)==1
    surfaces=[tuple(map(int,re.findall(r'\d+',n.get('bounds','')))) for n in contents[0].iter('node') if n.get('class')=='android.view.View' and len(n)==0]
    left,top,right,bottom=max(surfaces,key=lambda b:(b[2]-b[0])*(b[3]-b[1]))
    def tap(control):
        point=read('data/native-entry.json')[control];x,y=round(left+point[0]),round(top+point[1]);assert left<x<right and top<y<bottom
        shell('input','tap',x,y)
    tap('call');clicked=wait(lambda:(v if (v:=read('data/native-entry.json'))['callbacks']==1 else None))
    assert clicked['value']==43 and clicked['same_thread']
    (out/'native-entry.png').write_bytes(call(adb+['exec-out','screencap','-p']))
    tap('quit');closed=wait(lambda:(v if (v:=read('data/native-entry.json'))['shutdown_called'] else None))
    assert closed['vm_closed'] and closed['same_thread']
    def stopped():
        try:return not shell('pidof',package)
        except subprocess.CalledProcessError:return True
    wait(stopped)
    result={'passed':True,'abi':args.abi,'native_translation':args.abi!=shell('getprop','ro.product.cpu.abilist').split(',')[0],
            'session':session,'startup':first,'activity_recreation':recreated,'callback':clicked,'shutdown':closed,'process_exited':True,
            'screenshot':str(out/'native-entry.png')}
    if system is not None: result['system']=system
    (out/'report.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result,indent=2))


if __name__=='__main__':main()
