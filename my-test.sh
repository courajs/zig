#!/bin/bash

zig build test-behavior -Dskip-release

# Usage: /Users/aaron/dev/zig/zig/build/zig build [steps] [options]
# 
# Steps:
#   install (default)            Copy build artifacts to prefix path
#   uninstall                    Remove build artifacts from prefix path
#   docs                         Build documentation
#   test-toolchain               Run the tests for the toolchain
#   test-stage2                  Run the stage2 compiler tests
#   test-fmt                     Run zig fmt against build.zig to make sure it works
#   test-behavior                Run the behavior tests
#   test-compiler-rt             Run the compiler_rt tests
#   test-minilibc                Run the mini libc tests
#   test-compare-output          Run the compare output tests
#   test-standalone              Run the standalone tests
#   test-stack-traces            Run the stack trace tests
#   test-cli                     Test the command line interface
#   test-asm-link                Run the assemble and link tests
#   test-runtime-safety          Run the runtime safety tests
#   test-translate-c             Run the C translation tests
#   test-run-translated-c        Run the Run-Translated-C tests
#   test-std                     Run the standard library tests
#   test                         Run all the tests
# 
# General Options:
#   -p, --prefix [path]          Override default install prefix
#   --prefix-lib-dir [path]      Override default library directory path
#   --prefix-exe-dir [path]      Override default executable directory path
#   --prefix-include-dir [path]  Override default include directory path
# 
#   --sysroot [path]             Set the system root directory (usually /)
#   --search-prefix [path]       Add a path to look for binaries, libraries, headers
#   --libc [file]                Provide a file which specifies libc paths
# 
#   -h, --help                   Print this help and exit
#   --verbose                    Print commands before executing them
#   --color [auto|off|on]        Enable or disable colored error messages
#   --prominent-compile-errors   Output compile errors formatted for a human to read
# 
# Project-Specific Options:
#   -Drelease=[bool]             Create a release build (ReleaseFast)
#   -Dtarget=[string]            The CPU architecture, OS, and ABI to build for
#   -Dcpu=[string]               Target CPU features to add or subtract
#   -Dsingle-threaded=[bool]     Build artifacts that run in single threaded mode
#   -Duse-zig-libcxx=[bool]      If libc++ is needed, use zig's bundled version, don't try to integrate with the system
#   -Dskip-debug=[bool]          Main test suite skips debug builds
#   -Dskip-release=[bool]        Main test suite skips release builds
#   -Dskip-release-small=[bool]  Main test suite skips release-small builds
#   -Dskip-release-fast=[bool]   Main test suite skips release-fast builds
#   -Dskip-release-safe=[bool]   Main test suite skips release-safe builds
#   -Dskip-non-native=[bool]     Main test suite skips non-native builds
#   -Dskip-libc=[bool]           Main test suite skips tests that link libc
#   -Dskip-compile-errors=[bool] Main test suite skips compile error tests
#   -Dskip-run-translated-c=[bool] Main test suite skips run-translated-c tests
#   -Dskip-stage2-tests=[bool]   Main test suite skips self-hosted compiler tests
#   -Dskip-install-lib-files=[bool] Do not copy lib/ files to installation prefix
#   -Dlib-files-only=[bool]      Only install library files
#   -Dstage1=[bool]              Build the stage1 compiler, put stage2 behind a feature flag
#   -Domit-stage2=[bool]         Do not include stage2 behind a feature flag inside stage1
#   -Dstatic-llvm=[bool]         Disable integration with system-installed LLVM, Clang, LLD, and libc++
#   -Denable-llvm=[bool]         Build self-hosted compiler with LLVM backend enabled
#   -Dllvm-has-m68k=[bool]       Whether LLVM has the experimental target m68k enabled
#   -Dllvm-has-csky=[bool]       Whether LLVM has the experimental target csky enabled
#   -Dllvm-has-ve=[bool]         Whether LLVM has the experimental target ve enabled
#   -Dllvm-has-arc=[bool]        Whether LLVM has the experimental target arc enabled
#   -Denable-macos-sdk=[bool]    Run tests requiring presence of macOS SDK and frameworks
#   -Dconfig_h=[string]          Path to the generated config.h
#   -Dtracy=[string]             Enable Tracy integration. Supply path to Tracy source
#   -Dtracy-callstack=[bool]     Include callstack information with Tracy data. Does nothing if -Dtracy is not provided
#   -Dtracy-allocation=[bool]    Include allocation information with Tracy data. Does nothing if -Dtracy is not provided
#   -Dforce-link-libc=[bool]     Force self-hosted compiler to link libc
#   -Dstrip=[bool]               Omit debug information
#   -Dmem-leak-frames=[int]      How many stack frames to print when a memory leak occurs. Tests get 2x this amount.
#   -Dlog=[bool]                 Whether to enable logging
#   -Dlink-snapshot=[bool]       Whether to enable linker state snapshots
#   -Dversion-string=[string]    Override Zig version string. Default is to find out with git.
#   -Dtest-filter=[string]       Skip tests that do not match filter
#   -Denable-wine=[bool]         Use Wine to run cross compiled Windows tests
#   -Denable-qemu=[bool]         Use QEMU to run cross compiled foreign architecture tests
#   -Denable-wasmtime=[bool]     Use Wasmtime to enable and run WASI libstd tests
#   -Denable-darling=[bool]      [Experimental] Use Darling to run cross compiled macOS tests
#   -Denable-foreign-glibc=[string] Provide directory with glibc installations to run cross compiled tests that link glibc
# 
# Advanced Options:
#   --build-file [file]          Override path to build.zig
#   --cache-dir [path]           Override path to zig cache directory
#   --zig-lib-dir [arg]          Override path to Zig lib directory
#   --verbose-tokenize           Enable compiler debug output for tokenization
#   --verbose-ast                Enable compiler debug output for parsing into an AST
#   --verbose-link               Enable compiler debug output for linking
#   --verbose-air                Enable compiler debug output for Zig AIR
#   --verbose-llvm-ir            Enable compiler debug output for LLVM IR
#   --verbose-cimport            Enable compiler debug output for C imports
#   --verbose-cc                 Enable compiler debug output for C compilation
#   --verbose-llvm-cpu-features  Enable compiler debug output for LLVM CPU features
