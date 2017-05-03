import PackageDescription

let package = Package(
    name: "mist",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1, minor: 5),
        .Package(url: "https://github.com/vapor/postgresql-provider.git", majorVersion: 1, minor: 1),
        .Package(url: "https://github.com/calebkleveter/postgres-admin-panel.git", Version(0,10,1)),
        .Package(url: "https://github.com/calebkleveter/SwiftMark.git", majorVersion: 1, minor: 2)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
        ]
)
