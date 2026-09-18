#include "sqgi_json_scan.h"
#include "sqgi_json_numbers.h"
#include <cassert>
#include <cmath>
#include <cstdint>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <limits>
#include <vector>
#ifndef _WIN32
#include <sys/mman.h>
#include <unistd.h>
#endif
// Do not let release builds remove checks.
#define CHECK(x) do { if (!(x)) { std::fprintf(stderr, "failed line %d: %s\n", __LINE__, #x); std::abort(); } } while (0)
static size_t plain(const char *s, size_t n) {
    size_t i=0; while(i<n && (unsigned char)s[i]>=32 && s[i]!='"' && s[i]!='\\') ++i; return i;
}
static size_t space(const char *s, size_t n) {
    size_t i=0; while(i<n && (s[i]==' ' || s[i]=='\t' || s[i]=='\r' || s[i]=='\n')) ++i; return i;
}
static void scan(const char *s,size_t n) {
    CHECK(sqgi_json_plain_span(s,n)==plain(s,n));
    CHECK(sqgi_json_space_span(s,n)==space(s,n));
}
int main() {
    char storage[320];
    for(size_t offset=0;offset<16;++offset) {
        char *s=storage+offset;
        for(size_t n : {0,1,15,16,17,31,32,33,63,64,65,127,128,129}) {
            for(int background : {'a',' '}) {
                std::memset(s,background,n);
                scan(s,n);
                for(size_t pos=0;pos<n;++pos) {
                    for(unsigned c=0;c<256;++c) {
                        s[pos]=(char)c; scan(s,n);
                    }
                    s[pos]=(char)background;
                }
            }
        }
    }
#ifndef _WIN32
    size_t page=(size_t)sysconf(_SC_PAGESIZE);
    char *mem=(char *)mmap(nullptr,page*2,PROT_READ|PROT_WRITE,MAP_PRIVATE|MAP_ANONYMOUS,-1,0);
    CHECK(mem!=MAP_FAILED);
    CHECK(mprotect(mem+page,page,PROT_NONE)==0);
    for(size_t n=0;n<=256;++n) {
        char *s=mem+page-n;
        for(int c : {97,32,255}) { std::memset(s,c,n); scan(s,n); }
    }
    munmap(mem,page*2);
#endif
    uint64_t state=0x718827abcdULL;
    for(size_t i=0;i<100000;++i) {
        state^=state<<13;state^=state>>7;state^=state<<17;
        double input; std::memcpy(&input,&state,8);
        if(!std::isfinite(input)) continue;
        char buf[64]; size_t n=sqgi_json_format_double(buf,sizeof(buf)-1,input);
        CHECK(n>0);buf[n]=0;
        // Independent libc oracle, including subnormal and negative-zero bits.
        char *end=nullptr; double oracle=std::strtod(buf,&end);
        CHECK(end==buf+n && std::memcmp(&input,&oracle,8)==0);
        double output=0;
        CHECK(sqgi_json_parse_double(buf,buf+n,&output));
        CHECK(std::memcmp(&input,&output,8)==0);
        // Parse independently formatted 17-digit values too.
        int length=std::snprintf(buf,sizeof(buf),"%.17g",input);
        CHECK(sqgi_json_parse_double(buf,buf+length,&output));
        CHECK(std::memcmp(&input,&output,8)==0);
    }
    for(const char *s : {"-0.0", "5e-324", "2.2250738585072014e-308", "1.7976931348623157e308",
                         "9007199254740993", "9223372036854775808", "0.1000000000000000055511151231257827021181583404541015625"}) {
        double x=0,y=std::strtod(s,nullptr);
        CHECK(sqgi_json_parse_double(s,s+std::strlen(s),&x));
        CHECK(std::memcmp(&x,&y,8)==0);
    }
    double x=42;
    const char *overflow="1e9999", *underflow="1e-9999";
    CHECK(!sqgi_json_parse_double(overflow,overflow+6,&x));
    CHECK(!sqgi_json_parse_double(underflow,underflow+7,&x));
    std::puts("JSON scans and number conversions passed");
}
