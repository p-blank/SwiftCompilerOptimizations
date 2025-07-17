@inlinable
func inlinableCalculation(_ x: Double) -> Double {
    return (x * x + 2.0 * x + 1.0) / (x + 1.0)
}

func regularCalculation(_ x: Double) -> Double {
    return (x * x + 2.0 * x + 1.0) / (x + 1.0)
}

struct InlinableBenchmark: BenchmarkCase {
    let name = "@inlinable vs Regular (Inlining Optimization)"
    
    private let values: [Double]
    
    init() {
        values = (0..<1000000).map { Double($0 + 1) }
    }
    
    func runX() -> Any {
        var result = 0.0
        
        for _ in 0..<10 {
            for value in values {
                result += inlinableCalculation(value)
            }
        }
        
        return result
    }
    
    func runY() -> Any {
        var result = 0.0
        
        for _ in 0..<10 {
            for value in values {
                result += regularCalculation(value)
            }
        }
        
        return result
    }
} 