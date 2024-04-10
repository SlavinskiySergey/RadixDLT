import ProjectDescription
import ProjectDescriptionHelpers

let project = Project(
  name: Module.onboardingFlow.rawValue,
  targets: [
    .feature(
      implementation: .onboardingFlow,
      dependencies: [
        .appArchitecture,
        .feature(.birthdate),
        .feature(.nameFlow),
        .feature(.onboardingCompletion)
      ]
    )
  ]
)
