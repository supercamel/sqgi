#pragma once

/*
 * sqgi_stack.h — Stack-balance assertion helpers.
 *
 * Use SQGI_STACK_CHECK_BEGIN(v) / SQGI_STACK_CHECK_END(v, delta) at the top
 * and bottom of any function that touches the Squirrel stack to enforce
 * that the function consumed/produced exactly `delta` slots. Falls back
 * to a no-op in NDEBUG builds.
 */

#include <squirrel.h>

#ifndef NDEBUG
  #include <stdio.h>
  #include <stdlib.h>

  #define SQGI_STACK_CHECK_BEGIN(v) \
      SQInteger _sqgi_stack_top_at_entry = sq_gettop(v)

  #define SQGI_STACK_CHECK_END(v, expected_delta) \
      do { \
          SQInteger _now = sq_gettop(v); \
          SQInteger _delta = _now - _sqgi_stack_top_at_entry; \
          if (_delta != (SQInteger)(expected_delta)) { \
              fprintf(stderr, \
                  "sqgi: stack imbalance in %s at %s:%d — " \
                  "expected delta=%d, got delta=%d (entry=%d, now=%d)\n", \
                  __func__, __FILE__, __LINE__, \
                  (int)(expected_delta), (int)_delta, \
                  (int)_sqgi_stack_top_at_entry, (int)_now); \
              abort(); \
          } \
      } while (0)

  /* Just verify the top is the same as entry */
  #define SQGI_STACK_CHECK_BALANCED(v) SQGI_STACK_CHECK_END(v, 0)
#else
  #define SQGI_STACK_CHECK_BEGIN(v) ((void)0)
  #define SQGI_STACK_CHECK_END(v, expected_delta) ((void)0)
  #define SQGI_STACK_CHECK_BALANCED(v) ((void)0)
#endif
