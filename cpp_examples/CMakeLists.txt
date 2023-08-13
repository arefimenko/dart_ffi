cmake_minimum_required(VERSION 3.10)
project(cpp_examples LANGUAGES CXX C)
add_library(cpp_examples SHARED cpp_examples.cpp)

set(CMAKE_BUILD_TYPE Release)