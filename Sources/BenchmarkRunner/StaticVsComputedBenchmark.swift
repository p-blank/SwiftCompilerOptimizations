struct MathConstants {
    static let staticPi = 3.141592653589793
    static let staticE = 2.718281828459045
    
    static var computedPi: Double {
        return 3.141592653589793
    }
    
    static var computedE: Double {
        return 2.718281828459045
    }
}

struct StaticVsComputedBenchmark: BenchmarkCase {
    let name = "Static vs Computed (Constant Folding)"
    
    private let iterations = 1000000
    
    func runX() -> Any {
        var result = 0.0
        
        for _ in 0..<20 {
            for i in 0..<iterations {
                let radius = Double(i)
                result += MathConstants.staticPi * radius * radius + MathConstants.staticE
            }
        }
        
        return result
    }
    
    func runY() -> Any {
        var result = 0.0
        
        for _ in 0..<20 {
            for i in 0..<iterations {
                let radius = Double(i)
                result += MathConstants.computedPi * radius * radius + MathConstants.computedE
            }
        }
        
        return result
    }
} 