struct OptionalMapBenchmark: BenchmarkCase {
    let name = "Optional Map (Functional Optimization)"
    
    private let optionalStrings: [String?]
    
    init() {
        optionalStrings = (0..<500000).map { i in
            i % 7 == 0 ? nil : "value_\(i)"
        }
    }
    
    func runX() -> Any {
        var totalLength = 0
        
        for _ in 0..<20 {
            for optString in optionalStrings {
                totalLength += optString.map { $0.count } ?? 0
            }
        }
        
        return totalLength
    }
    
    func runY() -> Any {
        var totalLength = 0
        
        for _ in 0..<20 {
            for optString in optionalStrings {
                if let string = optString {
                    totalLength += string.count
                }
            }
        }
        
        return totalLength
    }
} 