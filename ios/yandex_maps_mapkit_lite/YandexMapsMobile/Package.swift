// swift-tools-version: 5.6

import PackageDescription

let package = Package(
    name: "YandexMapsMobile",
    defaultLocalization: "en",
    platforms: [.iOS("15.0")],
    products: [
        .library(
            name: "YandexMapsMobile",
            type: .static,
            targets: [
                "YandexMapsMobile",
                "YandexMapsMobileResources"
            ]
        ),
    ],
    targets: [
        .binaryTarget(
            name: "YandexMapsMobile",
            url: "https://maps-ios-pods-public.s3.yandex.net/YandexMapsMobile-4.45.0-lite-flutter.framework.zip",
            checksum: "5f15d70d314f3e571d536454420baedc695ed95861f9892f63938597140edf35"
        ),
        .target(
            name: "YandexMapsMobileResources",
            path: "Resources",
            linkerSettings: [
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedFramework("CoreLocation"),
                .linkedFramework("UIKit"),
                .linkedFramework("OpenGLES"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("Security"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("CoreMotion"),
                .linkedFramework("DeviceCheck"),
                .linkedFramework("NetworkExtension"),
                .linkedLibrary("resolv"),
                .linkedLibrary("c++"),
            ]

        )
    ]
)
