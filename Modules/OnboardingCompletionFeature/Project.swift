import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: Module.onboardingCompletion.rawValue,
  targets: [
    .feature(
      implementation: .onboardingCompletion,
      dependencies: [
        .appArchitecture
      ]
    )
  ]
)
