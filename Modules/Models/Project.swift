import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: Module.models.rawValue,
  targets: [
    .feature(
      implementation: .models
    )
  ]
)
