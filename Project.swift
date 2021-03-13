import ProjectDescription

struct Constants {
    static let appName = "AppName"
    static let organizationName = "MyOrg"
    static let bundleId = "io.agsoares.AppName"
} 

let project = Project(
    name: Constants.appName,
    organizationName: Constants.organizationName,
    targets: [
        Target(
            name: Constants.appName,
            platform: .iOS,
            product: .app,
            bundleId: Constants.bundleId,
            deploymentTarget: .iOS(targetVersion: "13.0", devices: [.iphone]),
            infoPlist: "Config/App-Info.plist",
            sources: ["Sources/**"],
            resources: ["Resources/**"],
            actions: [
                .post(
                    script: "swiftlint || true",
                    name: "SwiftLint"
                )
            ],
            dependencies: [ 
                .cocoapods(path: ".") // Expects a Podfile in the directory of the target's project
            ]
        ),
        Target(
            name: "\(Constants.appName)Tests",
            platform: .iOS,
            product: .unitTests,
            bundleId: "\(Constants.bundleId)Tests",
            infoPlist: "Config/Tests-Info.plist",
            sources: ["Tests/**"],
            dependencies: [.target(name: Constants.appName)]
        )
        
    ]
)
