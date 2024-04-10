import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: Module.appArchitecture.rawValue,
  packages: [
    .composableArchitecture
  ],
  targets: [
    .feature(
      implementation: .appArchitecture,
      dependencies: [
        .external(.composableArchitecture)
      ]
    )
  ]
)
