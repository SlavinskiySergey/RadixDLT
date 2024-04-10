import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: Module.nameFlow.rawValue,
  targets: [
    .feature(
      implementation: .nameFlow,
      dependencies: [
        .appArchitecture,
        .feature(.models)
      ]
    )
  ]
)
