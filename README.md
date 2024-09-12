# Portable LLVM IR Base64 Decoder

This repository is a fork of fastbase64, which implements SIMD-accelerated base64 encoding/decoding. In this fork, I have contributed the following key improvements:

* Portability Enhancement: Replaced architecture-specific AVX2 SIMD instructions with general LLVM IR instructions to enable cross-platform compatibility.
* LLVM and Clang Integration: Added functionality to compile and test using Clang, ensuring the solution works across multiple architectures.
* Performance Testing: Maintained the original benchmarking functionality while adapting it to test the generalized LLVM IR implementation.

## Commands to Compile and Test

1. Compile the LLVM IR file to an object file:
```
$ llc -filetype=obj fastavxbase64o3.ll -o fastavxbase64o3.o
```

3. Run the benchmark tests:
```
$ make 
$ ./basic_benchmark
```

