cmake_minimum_required(VERSION 2.8)
set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}-std=c++11 -Wall")
project(total)

execute_process(COMMAND python3 A/preparing.py)
include_directories(${CMAKE_CURRENT_LIST_DIR})
include_directories("C")
add_subdirectory("B")

add_executable(RunProject C/main.cpp )
