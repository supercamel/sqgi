cmake_minimum_required(VERSION 3.22)
project(sqmobile_cpp LANGUAGES CXX)
find_package(PkgConfig REQUIRED)
pkg_check_modules(BASE REQUIRED IMPORTED_TARGET sqmobile-1.0)
add_library(sqmobile-cpp SHARED sq-mobile-cpp.cpp)
target_link_libraries(sqmobile-cpp PRIVATE PkgConfig::BASE)
target_compile_features(sqmobile-cpp PRIVATE cxx_std_17)
find_program(GI_SCANNER g-ir-scanner REQUIRED)
find_program(GI_COMPILER g-ir-compiler REQUIRED)
set(GIR ${CMAKE_CURRENT_BINARY_DIR}/SqMobileCpp-1.0.gir)
set(TYPELIB ${CMAKE_CURRENT_BINARY_DIR}/SqMobileCpp-1.0.typelib)
add_custom_command(OUTPUT ${GIR}
  COMMAND ${GI_SCANNER} --namespace=SqMobileCpp --nsversion=1.0 --identifier-prefix=SqMobileCpp
    --symbol-prefix=sq_mobile_cpp --include=SqMobile-1.0 --pkg=sqmobile-1.0
    --library=sqmobile-cpp --library-path=${CMAKE_CURRENT_BINARY_DIR}
    --output=${GIR} ${CMAKE_CURRENT_SOURCE_DIR}/sq-mobile-cpp.h
  DEPENDS sqmobile-cpp sq-mobile-cpp.h VERBATIM)
add_custom_command(OUTPUT ${TYPELIB} COMMAND ${GI_COMPILER} ${GIR} --output=${TYPELIB} DEPENDS ${GIR} VERBATIM)
add_custom_target(metadata ALL DEPENDS ${TYPELIB})
install(TARGETS sqmobile-cpp LIBRARY DESTINATION lib)
install(FILES sq-mobile-cpp.h DESTINATION include)
install(FILES ${GIR} DESTINATION share/gir-1.0)
install(FILES ${TYPELIB} DESTINATION lib/girepository-1.0)
