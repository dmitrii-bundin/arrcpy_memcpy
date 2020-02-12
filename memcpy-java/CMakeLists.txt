cmake_minimum_required(VERSION 3.10)

set(CMAKE_EXPORT_COMPILE_COMMANDS 1)

project(memcpy_java C ASM_NASM)

if(NOT DEFINED ENV{JAVA_HOME})
    message(FATAL_ERROR "JAVA_HOME is not set")
endif()

set(MEMCPY_JAVA_C_FLAGS "-Werror \
                         -Wextra \
                         -Wall \
                         -pedantic \
                         -Wno-stack-protector \
                         -g3 \
                         -O3 \
                         -Wno-unused-result \
                         -Wno-unused-parameter")
set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} ${MEMCPY_JAVA_C_FLAGS}")

set(MEMCPY_JAVA_ASM_NASM_FLAGS "-f elf64 -g")
set(CMAKE_ASM_NASM_LINK_EXECUTABLE "ld <FLAGS> <CMAKE_ASM_NASM_LINK_FLAGS> <LINK_FLAGS> <OBJECTS>  -o <TARGET> <LINK_LIBRARIES>")
set(CMAKE_ASM_NASM_COMPILE_OBJECT "${CMAKE_ASM_NASM_COMPILE_OBJECT} ${MEMCPY_JAVA_ASM_NASM_FLAGS}")

set(MEMCPY_JAVA_JNILIB_SOURCES "src/com_test_Main.c")
add_library(iocrit SHARED ${MEMCPY_JAVA_JNILIB_SOURCES})
target_include_directories(iocrit PUBLIC include PRIVATE $ENV{JAVA_HOME}/include $ENV{JAVA_HOME}/include/linux)

set(IO_JNI_CRIT_SRC "src/com_test_Memcpy.c")
add_library(memcpy_java SHARED ${MEMCPY_JAVA_JNILIB_SOURCES})
target_include_directories(memcpy_java PUBLIC include PRIVATE $ENV{JAVA_HOME}/include $ENV{JAVA_HOME}/include/linux)

set(MEMCPY_JAVA_BIN_SOURCES "src/main.c")
set(MEMCPY_JAVA_BIN_SINGLE_SHOT_SOURCE "src/single_shot.c")
set(MEMCPY_JAVA_ASM_NASM_SOURCES "src/memcopy.S")
set_source_files_properties(${MEMCPY_JAVA_ASM_NASM_SOURCES} PROPERTIES LANGUAGE ASM_NASM)
add_executable(bin ${MEMCPY_JAVA_BIN_SOURCES} ${MEMCPY_JAVA_ASM_NASM_SOURCES})
add_executable(single_shot ${MEMCPY_JAVA_BIN_SINGLE_SHOT_SOURCE} ${MEMCPY_JAVA_ASM_NASM_SOURCES})
target_include_directories(bin PUBLIC include)
set_target_properties(bin PROPERTIES LINKER_LANGUAGE C)