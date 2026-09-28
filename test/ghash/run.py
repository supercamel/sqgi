"""Build an isolated native GI fixture and exercise actual SQGI calls."""
import os
from pathlib import Path
import subprocess
import sys
import tempfile

root = Path(__file__).resolve().parent
runtime = str(Path(sys.argv[1]).resolve())
with tempfile.TemporaryDirectory(prefix='sqgi-ghash-') as directory:
    work = Path(directory)
    flags = subprocess.check_output(['pkg-config','--cflags','--libs','gmodule-2.0'],text=True).split()
    subprocess.run(['cc','-shared','-fPIC',str(root/'fixture.c'),'-o',str(work/'libhashfixture.so'),*flags],check=True)
    functions=[]
    for name, symbol, transfer, value, result, extra in [
        ('borrow','borrow','none','utf8','guint',''),
        ('required','borrow','none','utf8','guint',''),
        ('take','take','full','utf8','guint',''),
        ('hold','hold','full','utf8','none',''),
        ('strings','strings','none','utf8','gboolean',''),
        ('enum_zero','enum_zero','none','Value','gboolean',''),
        ('error','error','full','utf8','none',''),
        ('later','later','full','utf8','none','<parameter name="number" transfer-ownership="none"><type name="gint" c:type="gint"/></parameter>'),
        ('container','borrow','container','utf8','guint',''),
        ('unsupported','borrow','none','gint','guint','')]:
        throws=' throws="1"' if name=='error' else ''
        nullable='0' if name=='required' else '1'
        functions.append(f'''<function name="{name}" c:identifier="hash_fixture_{symbol}"{throws}>
<return-value transfer-ownership="none"><type name="{result}"/></return-value>
<parameters><parameter name="table" transfer-ownership="{transfer}" nullable="{nullable}">
<type name="GLib.HashTable" c:type="GHashTable*"><type name="utf8"/><type name="{value}"/></type>
</parameter>{extra}</parameters></function>''')
    functions.append('<function name="finish" c:identifier="hash_fixture_finish"><return-value transfer-ownership="none"><type name="gboolean"/></return-value></function>')
    gir='''<?xml version="1.0"?>
<repository version="1.2" xmlns="http://www.gtk.org/introspection/core/1.0" xmlns:c="http://www.gtk.org/introspection/c/1.0" xmlns:glib="http://www.gtk.org/introspection/glib/1.0">
<include name="GLib" version="2.0"/>
<namespace name="HashFixture" version="1.0" shared-library="libhashfixture.so" c:identifier-prefixes="HashFixture" c:symbol-prefixes="hash_fixture">
<enumeration name="Value" c:type="HashFixtureValue"><member name="zero" value="0" c:identifier="HASH_ZERO"/><member name="one" value="1" c:identifier="HASH_ONE"/></enumeration>
'''+''.join(functions)+'</namespace></repository>'
    (work/'HashFixture-1.0.gir').write_text(gir)
    subprocess.run(['g-ir-compiler',str(work/'HashFixture-1.0.gir'),'-o',str(work/'HashFixture-1.0.typelib')],check=True)
    env=dict(os.environ,G_DEBUG='fatal-criticals')
    for key in ['GI_TYPELIB_PATH','LD_LIBRARY_PATH']:
        env[key]=str(work)+os.pathsep+env.get(key,'')
    subprocess.run([runtime,str(root/'test.nut')],env=env,check=True,timeout=30)
