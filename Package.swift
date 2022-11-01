// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XcapRxKit",
    platforms: [.iOS(.v11), .macOS(.v11)],
    products: [
        .library(name: "XcapRxKit", targets: ["XcapRxKit"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ReactiveX/RxSwift.git", .upToNextMajor(from: "6.5.0"))
    ],
    targets: [
        .target(name: "XcapRxKit",
                dependencies: [
                    .product(name: "RxSwift", package: "RxSwift"),
                    .product(name: "RxCocoa", package: "RxSwift")
                ]),
        .testTarget(name: "XcapRxKitTests",
                    dependencies: [
                        "XcapRxKit",
                        .product(name: "RxBlocking", package: "RxSwift")
                    ]),
    ]
)
