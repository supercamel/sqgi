from pathlib import Path
import shutil
P=Path('/tmp/sqgi-v29-allocation-fault');P.mkdir(exist_ok=True);old=Path('/tmp/sqgi-v28-allocation-fault')
for name in ['fail_exec.cpp','fail_exec.so','throw_new.cpp','throw_new.so']:shutil.copy2(old/name,P/name)
(P/'inject.gdb').write_text((old/'inject.gdb').read_text().replace('v28','v29'))
s=(old/'probe.cpp').read_text().replace('    const bool shared=argc>1 && strstr(argv[1],"shared");','    const bool compact=argc>1 && strstr(argv[1],"compact");\n    const bool shared=compact || (argc>1 && strstr(argv[1],"shared"));')
s=s.replace('n<24','n<(compact ? 56 : 24)').replace('(shared ? 55 : 2)','(shared ? (compact ? 119 : 55) : 2)')
s=s.replace('bool calls=false,arithmetic=false;','bool calls=false,arithmetic=false,tail_valid=true;')
s=s.replace('                arithmetic=arithmetic || word==0x8b0a0129u;','''                arithmetic=arithmetic || word==0x8b0a0129u;
                if((word&0xfc000000u)==0x94000000u) {
                    int32_t delta=(int32_t)(word&0x03ffffffu);
                    if(delta&0x02000000) delta-=0x04000000;
                    SQInteger target=off+(SQInteger)delta*4;
                    bool valid=target>=0 && target+24<=code.MappedSize();
                    uint32_t tail[6]={};
                    if(valid) memcpy(tail,(const unsigned char *)code.Entry()+target,sizeof(tail));
                    tail_valid=tail_valid && valid && (tail[0]&0xffc003ffu)==0xf94003e0u &&
                        tail[1]==0xaa1303e1u && tail[2]==0xaa1503e2u &&
                        tail[3]==0xaa1403e4u && tail[4]==0xaa1603e5u && tail[5]==0xd61f0200u;
                }''')
s=s.replace('if(!calls || !arithmetic)', 'if(!calls || !tail_valid || (compact ? arithmetic : !arithmetic))').replace('printf("SHARED_RICH_NATIVE=1\\n");','printf(compact ? "SHARED_COMPACT_NATIVE=1\\n" : "SHARED_RICH_NATIVE=1\\n");\n            printf("HELPER_TAIL_BRANCH=1\\n");')
(P/'probe.cpp').write_text(s)
print('Prepared 13 resource cases, including rich and compact tail-helper failure/retry')
