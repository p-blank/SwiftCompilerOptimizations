#!/bin/bash

echo "Swift Compiler Optimization Demonstration"
echo "========================================"
echo

echo "Building project..."
swift build > /dev/null 2>&1

echo "Running benchmarks without optimizations (-Onone):"
echo "================================================="
swift run -c debug BenchmarkRunner

echo
echo
echo "Running benchmarks with optimizations (-O):"
echo "==========================================="
swift run -c release BenchmarkRunner

echo
echo "Comparison complete!"
echo "The release build should show better performance for optimized patterns." 