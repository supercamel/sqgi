#include "sq-mobile-cpp.h"
#include <sq-mobile.h>
#include <stdexcept>
#include <vector>
gint sq_mobile_cpp_sum(gint a, gint b) {
    const std::vector<int> operands{a, b};
    return sq_mobile_sum(operands.at(0), operands.at(1));
}
gboolean sq_mobile_cpp_contains_exception(void) {
    try { throw std::runtime_error("contained in C++"); }
    catch (const std::exception &) { return TRUE; }
}
