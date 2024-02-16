// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let architecture = Target.Dependency.product(
  name: "ComposableArchitecture",
  package: "swift-composable-architecture"
)

let targets: [Target] = [
  .target(
    name: "AppCoreFeature",
    dependencies: [
      architecture,
      "HomeFlowFeature",
      "OnboardingFlowFeature",
      "SplashFeature"
    ]
  ),
  .target(
    name: "BirthdateFeature",
    dependencies: [
      architecture
    ]
  ),
  .target(
    name: "HomeFlowFeature",
    dependencies: [
      architecture,
      "Models",
      "NameFlowFeature",
      "UserDefaultsClient"
    ]
  ),
  .target(
    name: "Models"
  ),
  .target(
    name: "NameFlowFeature",
    dependencies: [
      architecture,
      "Models"
    ]
  ),
  .target(
    name: "OnboardingCompletionFeature",
    dependencies: [
      architecture
    ]
  ),
  .target(
    name: "OnboardingFlowFeature",
    dependencies: [
      architecture,
      "BirthdateFeature",
      "Models",
      "NameFlowFeature",
      "OnboardingCompletionFeature"
    ]
  ),
  .target(
    name: "SplashFeature",
    dependencies: [
      architecture,
      "Models",
      "UserDefaultsClient"
    ]
  ),
  .target(
    name: "UserDefaultsClient",
    dependencies: [
      architecture,
      "Models"
    ]
  )
]

let package = Package(
  name: "RadixLibrary",
  platforms: [.iOS(.v16)],
  products: targets
    .map { .library(name: $0.name, targets: [$0.name]) },
  dependencies: [
    .package(
      url: "https://github.com/pointfreeco/swift-composable-architecture",
      from: "1.7.3"
    )
  ],
  targets: targets
)
