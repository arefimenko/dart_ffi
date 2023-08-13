# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(dart_ffi_library VERSION 0.0.1 LANGUAGES C)

add_library(dart_ffi SHARED
  "dart_ffi.c"
)

set_target_properties(dart_ffi PROPERTIES
  PUBLIC_HEADER dart_ffi.h
  OUTPUT_NAME "dart_ffi"
)

target_compile_definitions(dart_ffi PUBLIC DART_SHARED_LIB)
