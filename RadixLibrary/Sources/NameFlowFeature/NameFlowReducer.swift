import ComposableArchitecture
import Foundation

@Reducer
public struct NameFlow {
  @ObservableState
  public struct State: Equatable {
    var root: Root.State
    public var name = ""
    public var surname = ""
    
    public init(name: String) {
      self.name = name
      self.root = .name(Name.State(name: name))
    }
  }
  
  public enum Action {
    case root(Root.Action)
  }
      
  public init() {}
  
  public var body: some ReducerOf<Self> {
    Scope(state: \.root, action: \.root) {
      Root()
    }
    Reduce { state, action in
      switch action {
      case .root(.name(.onProceedTapped)):
        state.root = .surname(Surname.State(surname: state.surname))
        return .none
        
      case .root(.name(.binding)):
        state.name = state.root.name?.name ?? ""
        return .none
        
      case .root(.name):
        return .none
        
      case .root(.nameCompletion(.backButtonTapped)):
        state.root = .surname(Surname.State(surname: state.surname))
        return .none
        
      case .root(.nameCompletion):
        return .none
        
      case .root(.surname(.onProceedTapped)):
        state.root = .nameCompletion(NameCompletion.State())
        return .none
        
      case .root(.surname(.backButtonTapped)):
        state.root = .name(Name.State(name: state.name))
        return .none
        
      case .root(.surname(.binding)):
        state.surname = state.root.surname?.surname ?? ""
        return .none

      case .root(.surname):
        return .none
      }
    }
  }
    
  @Reducer
  public struct Root {
    @ObservableState
    public enum State: Equatable {
      case name(Name.State)
      case nameCompletion(NameCompletion.State)
      case surname(Surname.State)
    }

    public enum Action {
      case name(Name.Action)
      case nameCompletion(NameCompletion.Action)
      case surname(Surname.Action)
    }

    public var body: some Reducer<State, Action> {
      Scope(state: \.name, action: \.name) {
        Name()
      }
      Scope(state: \.nameCompletion, action: \.nameCompletion) {
        NameCompletion()
      }
      Scope(state: \.surname, action: \.surname) {
        Surname()
      }
    }
  }
}
