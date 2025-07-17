struct ArrayOperationsBenchmark: BenchmarkCase {
    let name = "Array Operations (Bounds Checking)"
    
    private let numbers: [Double]
    
    init() {
        numbers = (0..<1000000).map { Double($0) }
    }
    
    func runX() -> Any {
        var sum = 0.0
        
        for _ in 0..<10 {
            for i in 0..<numbers.count {
                sum += numbers[i] * 2.0
            }
        }
        
        return sum
    }
    
    func runY() -> Any {
        var sum = 0.0
        
        for _ in 0..<10 {
            numbers.withUnsafeBufferPointer { buffer in
                for i in 0..<buffer.count {
                    sum += buffer[i] * 2.0
                }
            }
        }
        
        return sum
    }
} 