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
- Optional Handling (nil checking optimization)
- Optional Chaining (chain optimization)
- Optional Map (functional optimization)
- Force vs Safe Unwrap (nil check elimination)

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
- Enum 32% faster in optimized builds
- Better memory layout and branch prediction

**Optional Handling:**
- Nil coalescing (??) slightly faster than if-let (3% in optimized)
- Force unwrap vs safe unwrap: Nearly identical performance

**Optional Chaining:**
- Manual unwrapping 32% faster than chaining in optimized builds
- Compiler struggles to optimize deep optional chains

**Optional Map vs Manual:**
- Manual unwrapping significantly faster in debug (25%)
- Nearly identical in optimized builds (functional style optimizes well)

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