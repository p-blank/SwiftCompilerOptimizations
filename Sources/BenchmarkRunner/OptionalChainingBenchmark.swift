class Container {
    let value: Int
    let next: Container?
    
    init(value: Int, next: Container? = nil) {
        self.value = value
        self.next = next
    }
}

struct OptionalChainingBenchmark: BenchmarkCase {
    let name = "Optional Chaining (Chain Optimization)"
    
    private let containers: [Container?]
    
    init() {
        containers = (0..<100000).map { i in
            if i % 5 == 0 {
                return nil
            } else {
                let nested = i % 3 == 0 ? Container(value: i * 2) : nil
                return Container(value: i, next: nested)
            }
        }
    }
    
    func runX() -> Any {
        var sum = 0
        
        for _ in 0..<20 {
            for container in containers {
                sum += container?.next?.value ?? 0
            }
        }
        
        return sum
    }
    
    func runY() -> Any {
        var sum = 0
        
        for _ in 0..<20 {
            for container in containers {
                if let cont = container {
                    if let next = cont.next {
                        sum += next.value
                    }
                }
            }
        }
        
        return sum
    }
} 