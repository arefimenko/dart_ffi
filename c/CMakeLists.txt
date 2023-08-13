cmake_minimum_required(VERSION 3.10)
project(fibonacci LANGUAGES C)
add_library(fibonacci SHARED fibonacci.c)

set(CMAKE_BUILD_TYPE Release)