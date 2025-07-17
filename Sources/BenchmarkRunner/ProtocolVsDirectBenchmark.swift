protocol Drawable {
    func area() -> Double
}

struct Circle: Drawable {
    let radius: Double
    
    func area() -> Double {
        return 3.14159 * radius * radius
    }
}

final class ConcreteCircle {
    let radius: Double
    
    init(radius: Double) {
        self.radius = radius
    }
    
    func area() -> Double {
        return 3.14159 * radius * radius
    }
}

struct ProtocolVsDirectBenchmark: BenchmarkCase {
    let name = "Protocol vs Direct (Dispatch Optimization)"
    
    private let protocolShapes: [Drawable]
    private let concreteShapes: [ConcreteCircle]
    
    init() {
        protocolShapes = (0..<50000).map { i in
            Circle(radius: Double(i))
        }
        
        concreteShapes = (0..<50000).map { i in
            ConcreteCircle(radius: Double(i))
        }
    }
    
    func runX() -> Any {
        var totalArea = 0.0
        
        for _ in 0..<20 {
            for shape in protocolShapes {
                totalArea += shape.area()
            }
        }
        
        return totalArea
    }
    
    func runY() -> Any {
        var totalArea = 0.0
        
        for _ in 0..<20 {
            for shape in concreteShapes {
                totalArea += shape.area()
            }
        }
        
        return totalArea
    }
} 