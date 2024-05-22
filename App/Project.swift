import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: Module.app.rawValue,
  targets: [
    .makeApp(
      name: "RadixApp",
      dependencies: [
        .appArchitecture,
        .feature(.appCore)
      ]
    )
  ]
)
