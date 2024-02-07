// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "SDL2Test",
    targets: [
        .executableTarget(
            name: "SDL2Test", dependencies: ["CSDL2"]),
        .systemLibrary(
            name: "CSDL2"
        ),
    ]
)
