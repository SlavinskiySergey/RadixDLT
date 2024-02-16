import ComposableArchitecture
import Foundation

@Reducer
public struct NameCompletion {
  @ObservableState
  public struct State: Equatable {
    public init() {}
  }
  
  public enum Action {
    case backButtonTapped
    case onProceedTapped
  }
      
  public init() {}
  
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .backButtonTapped:
        return .none
        
      case .onProceedTapped:
        return .none
      }
    }
  }
}
