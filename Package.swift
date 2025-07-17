// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "compile-time-optimizations",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .executable(
            name: "BenchmarkRunner",
            targets: ["BenchmarkRunner"]
        )
    ],
    targets: [
        .executableTarget(
            name: "BenchmarkRunner",
            dependencies: [],
            swiftSettings: [
                .enableUpcomingFeature("BareSlashRegexLiterals")
            ]
        )
    ]
) 