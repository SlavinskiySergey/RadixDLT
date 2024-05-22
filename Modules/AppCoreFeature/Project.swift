import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: Module.appCore.rawValue,
  targets: [
    .feature(
      implementation: .appCore,
      dependencies: [
        .appArchitecture,
        .feature(.homeFlow),
        .feature(.onboardingFlow),
        .feature(.splash)
      ]
    )
  ]
)
