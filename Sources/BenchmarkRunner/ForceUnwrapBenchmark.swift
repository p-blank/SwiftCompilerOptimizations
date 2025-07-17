struct ForceUnwrapBenchmark: BenchmarkCase {
    let name = "Force vs Safe Unwrap (Nil Check Elimination)"
    
    private let guaranteedNumbers: [Int?]
    
    init() {
        guaranteedNumbers = (0..<1000000).map { i in
            Optional(i + 1)
        }
    }
    
    func runX() -> Any {
        var sum = 0
        
        for _ in 0..<10 {
            for number in guaranteedNumbers {
                sum += number!
            }
        }
        
        return sum
    }
    
    func runY() -> Any {
        var sum = 0
        
        for _ in 0..<10 {
            for number in guaranteedNumbers {
                if let value = number {
                    sum += value
                }
            }
        }
        
        return sum
    }
} 