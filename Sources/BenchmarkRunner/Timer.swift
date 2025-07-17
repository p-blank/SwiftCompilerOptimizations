import Foundation

struct BenchmarkTimer {
    static func measure<T>(_ operation: () throws -> T) rethrows -> (result: T, timeInSeconds: Double) {
        let startTime = CFAbsoluteTimeGetCurrent()
        let result = try operation()
        let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
        return (result, timeElapsed)
    }
    
    static func measureMultiple<T>(_ iterations: Int, _ operation: () throws -> T) rethrows -> (result: T, averageTimeInSeconds: Double) {
        var totalTime: Double = 0
        var lastResult: T?
        
        for _ in 0..<iterations {
            let measurement = try measure(operation)
            totalTime += measurement.timeInSeconds
            lastResult = measurement.result
        }
        
        return (lastResult!, totalTime / Double(iterations))
    }
} 