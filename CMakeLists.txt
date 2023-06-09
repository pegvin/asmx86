cmake_minimum_required(VERSION 3.24)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

set(CMAKE_ASM_NASM_OBJECT_FORMAT elf32)
set(CMAKE_ASM_NASM_LINK_EXECUTABLE "ld -m elf_i386 <LINK_FLAGS> <OBJECTS> -o <TARGET> <LINK_LIBRARIES>")

project(myasm C ASM_NASM)
file(GLOB_RECURSE SRC_FILES src/main.asm)
add_executable(myasm ${SRC_FILES})
