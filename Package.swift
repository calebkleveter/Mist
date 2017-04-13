import PackageDescription

let package = Package(
    name: "mist",
    dependencies: [
        .Package(url: "https://github.com/vapor/vapor.git", majorVersion: 1, minor: 5),
        .Package(url: "https://github.com/vapor/postgresql-provider.git", majorVersion: 1, minor: 1),
        .Package(url: "../../packages/postgres-admin-panel/.git", Version(0,10,0))
    ],
    exclude: [
        "Config",
        "Database",
        "Localization",
        "Public",
        "Resources",
        ]
)
