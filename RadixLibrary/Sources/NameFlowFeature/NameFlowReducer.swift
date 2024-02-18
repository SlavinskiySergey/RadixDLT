import ComposableArchitecture
import Foundation

@Reducer
public struct NameFlow {
  enum Page: Int, Comparable {
    case name
    case surname
    case nameCompletion
    
    static func < (lhs: Page, rhs: Page) -> Bool {
      lhs.rawValue < rhs.rawValue
    }
  }
  
  @ObservableState
  public struct State: Equatable {
    var name: Name.State
    var nameCompletion = NameCompletion.State()
    var surname: Surname.State
    var selectedPage = Page.name
    
    public var userName: String {
      name.name
    }
    
    public var userSurname: String {
      surname.surname
    }
    
    public init(name: String, surname: String) {
      self.name = Name.State(name: name)
      self.surname = Surname.State(surname: surname)
    }
  }
  
  public enum Action {
    case name(Name.Action)
    case nameCompletion(NameCompletion.Action)
    case surname(Surname.Action)
  }
      
  public init() {}
  
  public var body: some ReducerOf<Self> {
    Scope(state: \.name, action: \.name) {
      Name()
    }
    Scope(state: \.nameCompletion, action: \.nameCompletion) {
      NameCompletion()
    }
    Scope(state: \.surname, action: \.surname) {
      Surname()
    }
    Reduce { state, action in
      switch action {
      case .name(.onProceedTapped):
        state.selectedPage = .surname
        return .none
        
      case .name:
        return .none
        
      case .nameCompletion(.backButtonTapped):
        state.selectedPage = .surname
        return .none
        
      case .nameCompletion:
        return .none
        
      case .surname(.backButtonTapped):
        state.selectedPage = .name
        return .none
        
      case .surname(.onProceedTapped):
        state.selectedPage = .nameCompletion
        return .none
        
      case .surname:
        return .none
      }
    }
  }    
}
