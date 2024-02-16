import ComposableArchitecture
import Foundation
import Models
import UserDefaultsClient

@Reducer
public struct Splash {
  @ObservableState
  public struct State: Equatable {
    public init() {}
  }
  
  public enum Action {
    case delegate(DelegateAction)
    case task
  }
  
  public enum DelegateAction {
    case userLoaded(User?)
  }
  
  @Dependency(\.userDefaultsClient) var userDefaultsClient
  
  public init() {}
  
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .delegate:
        return .none
        
      case .task:
        return .run { send in
          try await Task.sleep(for: .seconds(1))
          let user: User? = userDefaultsClient.read()
          await send(.delegate(.userLoaded(user)))
        }
      }
    }
  }
}
