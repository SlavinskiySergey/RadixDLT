import ComposableArchitecture
import Foundation

@Reducer
public struct Birthdate {
  @ObservableState
  public struct State: Equatable {
    public internal(set) var date = Date.now
    var isProceedEnabled = false
    
    public init() {}
  }
  
  public enum Action: BindableAction {
    case binding(BindingAction<State>)
    case onDateSelected
    case onProceedTapped
  }
  
  public init() {}
  
  public var body: some ReducerOf<Self> {
    BindingReducer()
    Reduce { state, action in
      switch action {
      case .binding:
        return .none
        
      case .onDateSelected:
        state.isProceedEnabled = true
        return .none
        
      case .onProceedTapped:
        return .none
      }
    }
  }
}
