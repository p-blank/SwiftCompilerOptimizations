enum Direction: CaseIterable {
    case north, south, east, west, northeast, northwest, southeast, southwest
}

struct SwitchVsIfBenchmark: BenchmarkCase {
    let name = "Switch vs If-Else (Pattern Matching Optimization)"
    
    private let directions: [Direction]
    
    init() {
        directions = (0..<100000).map { _ in Direction.allCases.randomElement()! }
    }
    
    func runX() -> Any {
        var score = 0
        
        for _ in 0..<50 {
            for direction in directions {
                switch direction {
                case .north:
                    score += 10
                case .south:
                    score += 20
                case .east:
                    score += 30
                case .west:
                    score += 40
                case .northeast:
                    score += 15
                case .northwest:
                    score += 25
                case .southeast:
                    score += 35
                case .southwest:
                    score += 45
                }
            }
        }
        
        return score
    }
    
    func runY() -> Any {
        var score = 0
        
        for _ in 0..<50 {
            for direction in directions {
                if direction == .north {
                    score += 10
                } else if direction == .south {
                    score += 20
                } else if direction == .east {
                    score += 30
                } else if direction == .west {
                    score += 40
                } else if direction == .northeast {
                    score += 15
                } else if direction == .northwest {
                    score += 25
                } else if direction == .southeast {
                    score += 35
                } else if direction == .southwest {
                    score += 45
                }
            }
        }
        
        return score
    }
} 