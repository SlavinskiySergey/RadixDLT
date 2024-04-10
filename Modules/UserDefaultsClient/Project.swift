import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: Module.userDefaults.rawValue,
  targets: [
    .feature(
      implementation: .userDefaults,
      dependencies: [
        .appArchitecture,
        .feature(.models)
      ]
    )
  ]
)
