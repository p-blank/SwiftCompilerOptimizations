func genericAdd<T: Numeric>(_ a: T, _ b: T) -> T {
    return a + b
}

func concreteAdd(_ a: Double, _ b: Double) -> Double {
    return a + b
}

func genericSum<T: Numeric>(_ numbers: [T]) -> T {
    return numbers.reduce(T.zero, genericAdd)
}

func concreteSum(_ numbers: [Double]) -> Double {
    return numbers.reduce(0.0, concreteAdd)
}

struct GenericVsConcreteBenchmark: BenchmarkCase {
    let name = "Generic vs Concrete (Specialization)"
    
    private let numbers: [Double]
    
    init() {
        numbers = (0..<1000000).map { Double($0) }
    }
    
    func runX() -> Any {
        var result = 0.0
        for _ in 0..<5 {
            result += genericSum(numbers)
        }
        return result
    }
    
    func runY() -> Any {
        var result = 0.0
        for _ in 0..<5 {
            result += concreteSum(numbers)
        }
        return result
    }
} 