import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: Module.homeFlow.rawValue,
  targets: [
    .feature(
      implementation: .homeFlow,
      dependencies: [
        .appArchitecture,
        .feature(.models),
        .feature(.nameFlow),
        .feature(.userDefaults)
      ]
    )
  ]
)
