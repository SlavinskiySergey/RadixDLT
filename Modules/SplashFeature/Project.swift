import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: Module.splash.rawValue,
  targets: [
    .feature(
      implementation: .splash,
      dependencies: [
        .appArchitecture,
        .feature(.models),
        .feature(.userDefaults)
      ]
    )
  ]
)
