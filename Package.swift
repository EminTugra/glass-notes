// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "GlassNotes",
    platforms: [
        .macOS(.v14),
        .iOS(.v17)
    ],
    products: [
        .executable(name: "GlassNotes", targets: ["GlassNotes"])
    ],
    targets: [
        .executableTarget(
            name: "GlassNotes",
            path: "."
        )
    ]
)
