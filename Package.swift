// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "SwiftUIBuddy",
    products: [.library(name: "SwiftUIBuddy", targets: ["SwiftUIBuddy"])],
    targets: [.target(name: "SwiftUIBuddy", path: "Sources") /*, .testTarget(name: "SwiftUIBuddyTests", dependencies: ["SwiftUIBuddy"])*/ ]
)
