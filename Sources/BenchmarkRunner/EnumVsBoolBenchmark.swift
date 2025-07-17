enum PlayerState {
    case idle, running, jumping, attacking
}

struct PlayerWithBools {
    var isIdle: Bool
    var isRunning: Bool
    var isJumping: Bool
    var isAttacking: Bool
    
    init() {
        isIdle = true
        isRunning = false
        isJumping = false
        isAttacking = false
    }
}

struct PlayerWithEnum {
    var state: PlayerState
    
    init() {
        state = .idle
    }
}

struct EnumVsBoolBenchmark: BenchmarkCase {
    let name = "Enum vs Bool Flags (State Optimization)"
    
    private var enumPlayers: [PlayerWithEnum]
    private var boolPlayers: [PlayerWithBools]
    
    init() {
        enumPlayers = (0..<50000).map { _ in PlayerWithEnum() }
        boolPlayers = (0..<50000).map { _ in PlayerWithBools() }
    }
    
    func runX() -> Any {
        var actionCount = 0
        
        for _ in 0..<20 {
            for i in enumPlayers.indices {
                let stateIndex = i % 4
                let state: PlayerState
                switch stateIndex {
                case 0: state = .idle
                case 1: state = .running
                case 2: state = .jumping
                case 3: state = .attacking
                default: state = .idle
                }
                
                switch state {
                case .idle: actionCount += 1
                case .running: actionCount += 2
                case .jumping: actionCount += 3
                case .attacking: actionCount += 4
                }
            }
        }
        
        return actionCount
    }
    
    func runY() -> Any {
        var actionCount = 0
        
        for _ in 0..<20 {
            for i in boolPlayers.indices {
                let stateIndex = i % 4
                let isIdle = (stateIndex == 0)
                let isRunning = (stateIndex == 1)
                let isJumping = (stateIndex == 2)
                let isAttacking = (stateIndex == 3)
                
                if isIdle {
                    actionCount += 1
                } else if isRunning {
                    actionCount += 2
                } else if isJumping {
                    actionCount += 3
                } else if isAttacking {
                    actionCount += 4
                }
            }
        }
        
        return actionCount
    }
} 