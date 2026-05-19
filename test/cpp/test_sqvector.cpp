#include "sqpcheader.h"
#include "squtils.h"

#include <stdio.h>

#define CHECK(cond, msg) \
    do { if (!(cond)) { fprintf(stderr, "FAIL: %s\n", msg); rc = 1; } } while (0)

struct Tracked {
    static int live;

    int value;

    Tracked(int v = 0) : value(v) { live++; }
    Tracked(const Tracked &other) : value(other.value) { live++; }
    ~Tracked() { live--; }

    Tracked &operator=(const Tracked &other)
    {
        value = other.value;
        return *this;
    }
};

int Tracked::live = 0;

int main(void)
{
    int rc = 0;

    {
        sqvector<Tracked> values;
        values.push_back(Tracked(10));
        values.push_back(Tracked(20));
        values.push_back(Tracked(30));

        CHECK(values.size() == 3, "push_back size");
        CHECK(Tracked::live == 3, "live count after push_back");

        values.remove(1);
        CHECK(values.size() == 2, "remove size");
        CHECK(values[0].value == 10, "remove keeps first value");
        CHECK(values[1].value == 30, "remove shifts tail with assignment");
        CHECK(Tracked::live == 2, "remove destroys exactly one object");

        values.reserve(1);
        CHECK(values.size() == 2, "reserve below size does not shrink");
        CHECK(Tracked::live == 2, "reserve below size preserves objects");

        values.reserve(16);
        CHECK(values.size() == 2, "reserve keeps size");
        CHECK(values[0].value == 10, "reserve keeps first value");
        CHECK(values[1].value == 30, "reserve keeps second value");
        CHECK(Tracked::live == 2, "reserve preserves live object count");

        values.resize(0);
        CHECK(values.size() == 0, "resize to zero");
        CHECK(Tracked::live == 0, "resize destroys remaining objects");
    }

    CHECK(Tracked::live == 0, "vector destructor leaves no live objects");

    if (rc == 0) printf("[OK] test_sqvector\n");
    return rc;
}
