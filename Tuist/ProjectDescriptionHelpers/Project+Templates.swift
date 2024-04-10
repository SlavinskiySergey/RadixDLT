import ProjectDescription

private let rootPackagesName = "com.radix.dlt"

private let deploymentTarget: DeploymentTargets = .iOS("16.0")

private func makeBundleID(with addition: String) -> String {
  (rootPackagesName + addition).lowercased()
}

extension Target {
  public static func makeApp(
    name: String,
    sources: ProjectDescription.SourceFilesList,
    dependencies: [ProjectDescription.TargetDependency]
  ) -> Target {
    .target(
      name: name,
      destinations: .iOS,
      product: .app,
      bundleId: makeBundleID(with: ".app"),
      deploymentTargets: deploymentTarget,
      infoPlist: .extendingDefault(with: infoPlistExtension),
      sources: sources,
      dependencies: dependencies
    )
  }

  public static func feature(
    implementation feature: Module,
    dependencies: [ProjectDescription.TargetDependency] = [],
    resources: ProjectDescription.ResourceFileElements? = []
  ) -> Target {
    .makeFramework(
      name: feature.rawValue,
        sources: ["src/**"],
        dependencies: dependencies,
        resources: resources
    )
  }
  
  private static func makeFramework(
    name: String,
    sources: ProjectDescription.SourceFilesList,
    dependencies: [ProjectDescription.TargetDependency] = [],
    resources: ProjectDescription.ResourceFileElements? = []
  ) -> Target {
    .target(
      name: name,
      destinations: .iOS,
      product: defaultPackageType,
      bundleId: makeBundleID(with: name + ".framework"),
      deploymentTargets: deploymentTarget,
      sources: sources,
      resources: resources,
      dependencies: dependencies
    )
  }
}

extension Package {
  public static var composableArchitecture: Package {
    .remote(
      url: "https://github.com/pointfreeco/swift-composable-architecture",
      requirement: .upToNextMinor(from: "1.9.2")
    )
  }
}
