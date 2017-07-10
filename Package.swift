import PackageDescription

let package = Package(
    name: "mist",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 2),
        .Package(url: "https://github.com/vapor-community/postgresql-provider.git", majorVersion: 2),
        .Package(url: "https://github.com/calebkleveter/postgres-admin-panel.git", Version(0,10,4)),
        .Package(url: "https://github.com/calebkleveter/SwiftMark.git", majorVersion: 1, minor: 3)
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
        ]
)
