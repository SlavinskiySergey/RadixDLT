import ComposableArchitecture
import Foundation
import Models

@Reducer
public struct Name {
  @ObservableState
  public struct State: Equatable {
    var name: String
    var isProceedEnabled: Bool
    
    public init(name: String) {
      self.name = name
      self.isProceedEnabled = !name.isEmpty
    }
  }
  
  public enum Action: BindableAction {
    case binding(BindingAction<State>)
    case onProceedTapped
  }
    
  public init() {}
  
  public var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        state.isProceedEnabled = !state.name.isEmpty
        return .none
                
      case .onProceedTapped:
        return .none
      }
    }
  }
}
