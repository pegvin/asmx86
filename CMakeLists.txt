cmake_minimum_required(VERSION 3.24)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_ASM_NASM_LINK_EXECUTABLE "ld <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")

if (LINUX)
	set(CMAKE_ASM_NASM_OBJECT_FORMAT elf64)
elseif (WIN32 OR CYGWIN)
	set(CMAKE_ASM_NASM_OBJECT_FORMAT win64)
else()
	message(FATAL_ERROR "Unknown Target System: \"" ${CMAKE_SYSTEM} "\"!")
endif()

project(myasm ASM_NASM)
file(GLOB_RECURSE SRC_FILES src/main.asm)
add_executable(myasm ${SRC_FILES})
