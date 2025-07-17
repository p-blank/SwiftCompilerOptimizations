protocol BenchmarkCase {
    var name: String { get }
    func runX() -> Any
    func runY() -> Any
    func setup()
    func teardown()
}

extension BenchmarkCase {
    func setup() {}
    func teardown() {}
}

struct BenchmarkResult {
    let caseName: String
    let xTime: Double
    let yTime: Double
    let speedupRatio: Double
    
    init(caseName: String, xTime: Double, yTime: Double) {
        self.caseName = caseName
        self.xTime = xTime
        self.yTime = yTime
        self.speedupRatio = yTime / xTime
    }
    
    var winner: String {
        speedupRatio > 1.0 ? "X" : "Y"
    }
    
    var performanceDifference: String {
        let ratio = max(speedupRatio, 1.0 / speedupRatio)
        return String(format: "%.2fx", ratio)
    }
} 