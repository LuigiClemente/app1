// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "BluetoothConnector",
  platforms: [
    .macOS(.v10_15)
  ],
  dependencies: [
    .package(url: "https://github.com/apple/swift-argument-parser.git", .exact("1.1.2")),
    .package(url: "https://github.com/swift-server/swift-websocket.git", .upToNextMajor(from: "1.0.0")),
    .package(url: "https://github.com/chrisballinger/Opus-iOS.git", .upToNextMajor(from: "7.0.6"))
  ],
  targets: [

    .executableTarget(
      name: "BluetoothConnector",
      dependencies: [
        .product(name: "ArgumentParser", package: "swift-argument-parser"),
        .product(name: "WebSocket", package: "swift-websocket"),
        .product(name: "COpus", package: "Opus-iOS")
      ]
    ),

    .testTarget(
      name: "BluetoothConnectorTests",
      dependencies: ["BluetoothConnector"]
    )

  ]
)