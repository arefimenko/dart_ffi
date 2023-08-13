cmake_minimum_required(VERSION 3.10)
project(calculator LANGUAGES CXX C)
add_library(calculator SHARED calculator.cpp calculator.def)

set(CMAKE_BUILD_TYPE Release)