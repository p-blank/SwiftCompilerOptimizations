struct Point2D {
    let x: Double
    let y: Double
    
    func distance(to other: Point2D) -> Double {
        let dx = x - other.x
        let dy = y - other.y
        return (dx * dx + dy * dy).squareRoot()
    }
}

class Point2DClass {
    let x: Double
    let y: Double
    
    init(x: Double, y: Double) {
        self.x = x
        self.y = y
    }
    
    func distance(to other: Point2DClass) -> Double {
        let dx = x - other.x
        let dy = y - other.y
        return (dx * dx + dy * dy).squareRoot()
    }
}

struct StructVsClassBenchmark: BenchmarkCase {
    let name = "Struct vs Class (ARC Elimination)"
    
    private let structPoints: [Point2D]
    private let classPoints: [Point2DClass]
    
    init() {
        structPoints = (0..<100000).map { i in
            Point2D(x: Double(i), y: Double(i * 2))
        }
        
        classPoints = (0..<100000).map { i in
            Point2DClass(x: Double(i), y: Double(i * 2))
        }
    }
    
    func runX() -> Any {
        var totalDistance = 0.0
        let origin = Point2D(x: 0, y: 0)
        
        for _ in 0..<10 {
            for point in structPoints {
                totalDistance += point.distance(to: origin)
            }
        }
        
        return totalDistance
    }
    
    func runY() -> Any {
        var totalDistance = 0.0
        let origin = Point2DClass(x: 0, y: 0)
        
        for _ in 0..<10 {
            for point in classPoints {
                totalDistance += point.distance(to: origin)
            }
        }
        
        return totalDistance
    }
} 