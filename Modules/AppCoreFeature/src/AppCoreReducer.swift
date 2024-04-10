import ComposableArchitecture
import Foundation
import HomeFlowFeature
import OnboardingFlowFeature
import SplashFeature

@Reducer
public struct AppCore {
  @ObservableState
  public enum State: Equatable {
    case homeFlow(HomeFlow.State)
    case onboardingFlow(OnboardingFlow.State)
    case splash(Splash.State)
    
    public init() {
      self = .splash(Splash.State())
    }
  }
  
  public enum Action {
    case homeFlow(HomeFlow.Action)
    case onboardingFlow(OnboardingFlow.Action)
    case splash(Splash.Action)
  }
  
  @Dependency(\.userDefaultsClient) var userDefaultsClient
  
  public init() {}
  
  public var body: some ReducerOf<Self> {
    Scope(state: \.homeFlow, action: \.homeFlow) {
      HomeFlow()
    }
    Scope(state: \.onboardingFlow, action: \.onboardingFlow) {
      OnboardingFlow()
    }
    Scope(state: \.splash, action: \.splash) {
      Splash()
    }
    Reduce { state, action in
      switch action {
      case .homeFlow:
        return .none
        
      case .onboardingFlow(.path(.element(_, .onboardingCompletion(.onSaveTapped)))):
        guard case let .onboardingFlow(onboardingFlowState) = state,
              let user = onboardingFlowState.user
        else { return .none }
        
        userDefaultsClient.create(model: user)
        state = .homeFlow(HomeFlow.State(user: user))
        return .none
        
      case .onboardingFlow:
        return .none
        
      case let .splash(.delegate(.userLoaded(user))):
        if let user {
          state = .homeFlow(HomeFlow.State(user: user))
        } else {
          state = .onboardingFlow(OnboardingFlow.State())
        }
        return .none
        
      case .splash:
        return .none
      }
    }
  }
}
