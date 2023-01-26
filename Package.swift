// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

 let package = Package(
     name: "SwiftUIBuddy",
     products: [.library(name: "SwiftUIBuddy", targets: ["SwiftUIBuddy"])],
     dependencies: [],
     targets: [.target(name: "SwiftUIBuddy", path: "Sources")]
)
