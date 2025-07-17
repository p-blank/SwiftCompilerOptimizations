# Swift Compiler Optimization Benchmarks

Benchmarks comparing different Swift coding patterns to demonstrate compiler optimizations in action.

## What This Tests

**Core Patterns:**
- Struct vs Class (ARC elimination)
- Generic vs Concrete (specialization) 
- Protocol vs Direct (dispatch optimization)
- Safe vs Unsafe Array access (bounds checking)

**Optimization Patterns:**
- Switch vs If-Else (pattern matching optimization)
- @inlinable vs Regular (inlining - Swift's constexpr)
- Static vs Computed (constant folding)
- Enum vs Bool Flags (state optimization)

## Usage

```bash
swift run BenchmarkRunner
```

## Key Findings

**Switch vs If-Else:**
- Debug: Switch 20% faster (jump table optimization)
- Release: Nearly identical (compiler optimizes both)

**@inlinable Functions:**
- Small but consistent performance gains in optimized builds
- Swift's equivalent to C++ constexpr for cross-module inlining

**Static vs Computed Properties:**
- Static constants win due to compile-time constant folding
- ~2% improvement in optimized builds

**Enum vs Bool Flags:**
- Enum 28% faster in optimized builds
- Better memory layout and branch prediction

## Build Modes

```bash
# See optimizations in action
swift run -c release BenchmarkRunner

# Baseline (no optimizations)  
swift run -c debug BenchmarkRunner

# Compare both modes side by side
./run-benchmarks.sh
```

## Performance Gains

Most patterns show **50-120x speedup** from debug to release mode, demonstrating the power of Swift's optimization pipeline. 