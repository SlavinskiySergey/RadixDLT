import ComposableArchitecture
import Foundation

@Reducer
public struct OnboardingCompletion {
  @ObservableState
  public struct State: Equatable {
    
    public init() {}
  }
  
  public enum Action {
    case onSaveTapped
  }
  
  public init() {}
  
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .onSaveTapped:
        return .none
      }
    }
  }
}
