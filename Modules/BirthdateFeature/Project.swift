import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: Module.birthdate.rawValue,
  targets: [
    .feature(
      implementation: .birthdate,
      dependencies: [
        .appArchitecture
      ]
    )
  ]
)
