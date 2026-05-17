cmake_minimum_required(VERSION 3.16)
project(Squirrel3 VERSION 3.2.0 LANGUAGES C CXX)

option(DISABLE_DYNAMIC "Disable dynamic libraries" OFF)
option(DISABLE_STATIC  "Disable static libraries"  OFF)
option(SQ_DISABLE_INSTALLER "Disable install targets" ON)

add_subdirectory(squirrel)
add_subdirectory(sqstdlib)
