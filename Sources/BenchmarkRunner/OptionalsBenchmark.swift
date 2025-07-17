struct OptionalsBenchmark: BenchmarkCase {
    let name = "Optional Handling (Nil Checking Optimization)"
    
    private let optionalNumbers: [Int?]
    private let mixedNumbers: [Int?]
    
    init() {
        optionalNumbers = (0..<1000000).map { i in
            i % 10 == 0 ? nil : i
        }
        
        mixedNumbers = (0..<1000000).map { i in
            i % 3 == 0 ? nil : i * 2
        }
    }
    
    func runX() -> Any {
        var sum = 0
        
        for _ in 0..<10 {
            for number in optionalNumbers {
                if let value = number {
                    sum += value
                }
            }
        }
        
        return sum
    }
    
    func runY() -> Any {
        var sum = 0
        
        for _ in 0..<10 {
            for number in optionalNumbers {
                sum += number ?? 0
            }
        }
        
        return sum
    }
} 