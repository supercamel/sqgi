#include "workloads.h"
#include <iostream>
using namespace sqkernel;
using kernel_workloads::integer;
// Generate different expressions/control-flow shapes, not merely different
// inputs to one expression. Unsigned arithmetic models specified i64 wrapping.
int main() {
    if(!supported())return 77;
    try {
        std::mt19937_64 random(0x6b65726e656cULL);unsigned cases=0;
        for(int program=0;program<24;++program) {
            const int locals=12+program%7;std::vector<uint64_t> coefficients;
            std::string source="export i64 generated(i64 x, i64 y, i64 count) {\n";
            for(int i=0;i<locals;++i){uint64_t coefficient=1+random()%31;coefficients.push_back(coefficient);
                source+="i64 v"+std::to_string(i)+" = x * "+std::to_string(coefficient)+" + y;\n";}
            source+="i64 result = 0;\nfor (i64 i = 0; i < count; i += 1) {\n";
            source+="for (i64 j = 0; j < 3; j += 1) {\n";
            for(int i=0;i<locals;++i) {
                std::string v="v"+std::to_string(i);
                source+="if ("+v+" < 0) { result += "+v+" * (j + 1); } else { result -= "+v+"; }\n";
            }
            source+="if (x == 0 || (y != 0 && x / y == 1)) { return result; }\n}}\nreturn result; }";
            auto m=compile(source,"generated-"+std::to_string(program)+".sqk");
            for(int input=0;input<32;++input) {
                uint64_t x=input==0?0:random(),y=input==1?0:random(),count=random()%5;
                uint64_t args[]={x,y,count};Call native{args,0,1000,0},oracle{args,0,1000,0};
                auto status=execute(*m,0,native),reference=interpret(m->functions[0],oracle);
                if(status!=reference||native.result!=oracle.result||native.fuel!=oracle.fuel||native.error_line!=oracle.error_line)
                    throw std::runtime_error("generated native/reference mismatch");
                uint64_t result=0;bool done=false;
                for(uint64_t i=0;i<count&&!done;++i)for(uint64_t j=0;j<3&&!done;++j) {
                    for(auto coefficient:coefficients){uint64_t v=x*coefficient+y;if(integer(v)<0)result+=v*(j+1);else result-=v;}
                    // The random inputs cannot select MIN/-1 here, but avoid UB
                    // in the independent model if the generator ever changes.
                    if(integer(x)==INT64_MIN&&integer(y)==-1)throw std::runtime_error("unsupported model input");
                    done=x==0||(y!=0&&integer(x)/integer(y)==1);
                }
                if(status!=Success||native.result!=result)throw std::runtime_error("generated C++ model mismatch");
                for(uint64_t fuel:{0,1,2,4}) {
                    native={args,0,fuel,0};oracle={args,0,fuel,0};
                    status=execute(*m,0,native);reference=interpret(m->functions[0],oracle);
                    if(status!=reference||native.result!=oracle.result||native.fuel!=oracle.fuel||native.error_line!=oracle.error_line)
                        throw std::runtime_error("generated fuel mismatch");
                    ++cases;
                }
                ++cases;
            }
        }
        std::cout<<cases<<" generated arithmetic/control-flow cases passed\n";
    }catch(const std::exception &e){std::cerr<<e.what()<<"\n";return 1;}
}
