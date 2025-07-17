import Foundation

struct BenchmarkRunner {
    let iterations = 5
    let warmupIterations = 2
    
    func run(benchmarks: [BenchmarkCase]) {
        print("Swift Compiler Optimization Benchmarks")
        print("=========================================")
        print()
        
        var results: [BenchmarkResult] = []
        
        for benchmark in benchmarks {
            print("Running: \(benchmark.name)")
            let result = runSingleBenchmark(benchmark)
            results.append(result)
            printResult(result)
            print()
        }
        
        printSummary(results)
    }
    
    private func runSingleBenchmark(_ benchmark: BenchmarkCase) -> BenchmarkResult {
        benchmark.setup()
        
        warmup(benchmark)
        
        let xMeasurement = BenchmarkTimer.measureMultiple(iterations) {
            benchmark.runX()
        }
        
        let yMeasurement = BenchmarkTimer.measureMultiple(iterations) {
            benchmark.runY()
        }
        
        benchmark.teardown()
        
        return BenchmarkResult(
            caseName: benchmark.name,
            xTime: xMeasurement.averageTimeInSeconds,
            yTime: yMeasurement.averageTimeInSeconds
        )
    }
    
    private func warmup(_ benchmark: BenchmarkCase) {
        for _ in 0..<warmupIterations {
            _ = benchmark.runX()
            _ = benchmark.runY()
        }
    }
    
    private func printResult(_ result: BenchmarkResult) {
        print("  X: \(formatTime(result.xTime))")
        print("  Y: \(formatTime(result.yTime))")
        print("  Winner: \(result.winner) (\(result.performanceDifference) faster)")
    }
    
    private func printSummary(_ results: [BenchmarkResult]) {
        print("Summary")
        print("=======")
        for result in results {
            print("\(result.caseName): \(result.winner) wins by \(result.performanceDifference)")
        }
    }
    
    private func formatTime(_ seconds: Double) -> String {
        return String(format: "%.6f s", seconds)
    }
}

let runner = BenchmarkRunner()
let benchmarks: [BenchmarkCase] = [
    StructVsClassBenchmark(),
    GenericVsConcreteBenchmark(),
    ProtocolVsDirectBenchmark(),
    ArrayOperationsBenchmark(),
    SwitchVsIfBenchmark(),
    InlinableBenchmark(),
    StaticVsComputedBenchmark(),
    EnumVsBoolBenchmark()
]

runner.run(benchmarks: benchmarks) 