import ComposableArchitecture
import Foundation
import Models

@Reducer
public struct Surname {
  @ObservableState
  public struct State: Equatable {
    var surname: String
    var isProceedEnabled: Bool
    
    public init(surname: String) {
      self.surname = surname
      self.isProceedEnabled = !surname.isEmpty
    }
  }
  
  public enum Action: BindableAction {
    case backButtonTapped
    case binding(BindingAction<State>)
    case onProceedTapped
  }
    
  public init() {}
  
  public var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .backButtonTapped:
        return .none
        
      case .binding:
        state.isProceedEnabled = !state.surname.isEmpty
        return .none
                
      case .onProceedTapped:
        return .none
      }
    }
  }
}
