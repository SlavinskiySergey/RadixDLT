import ProjectDescription

public enum Module: String {
  case app = "App"
  case appArchitecture = "AppArchitecture"
  case appCore = "AppCoreFeature"
  case birthdate = "BirthdateFeature"
  case homeFlow = "HomeFlowFeature"
  case models = "Models"
  case nameFlow = "NameFlowFeature"
  case onboardingCompletion = "OnboardingCompletionFeature"
  case onboardingFlow = "OnboardingFlowFeature"
  case splash = "SplashFeature"
  case userDefaults = "UserDefaultsClient"
}

public enum External: String {
  case composableArchitecture = "ComposableArchitecture"
}

extension ProjectDescription.TargetDependency {
  public static var appArchitecture: ProjectDescription.TargetDependency {
    .feature(.appArchitecture)
  }
  
  public static func feature(_ feature: Module) -> ProjectDescription.TargetDependency {
    .project(
      target: feature.rawValue,
      path: .relativeToRoot("Modules/" + feature.rawValue),
      condition: nil
    )
  }
  
  public static func external(_ module: External) -> ProjectDescription.TargetDependency  {
    .package(
      product: module.rawValue,
      type: .runtime,
      condition: nil
    )
  }
}
