import ComposableArchitecture
import Foundation
import Models
import NameFlowFeature
import UserDefaultsClient

@Reducer
public struct HomeFlow {
  @ObservableState
  public struct State: Equatable {
    var user: User
    @Presents var destination: Destination.State?
    
    var fullName: String? {
      guard !user.name.isEmpty, !user.surname.isEmpty else {
        return nil
      }
      return "\(user.name) \(user.surname)"
    }
    
    public init(user: User) {
      self.user = user
    }
  }
  
  public enum Action {
    case onChangeNameTapped
    case destination(PresentationAction<Destination.Action>)
  }
  
  @Dependency(\.userDefaultsClient) var userDefaultsClient
  
  public init() {}
  
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .destination(.presented(.nameFlow(.nameCompletion(.onProceedTapped)))):
        guard case let .some(.nameFlow(nameFlowState)) = state.destination
        else { return .none }
        
        let birthdate = state.user.birthdate
        state.user = User(
          birthdate: birthdate,
          name: nameFlowState.userName,
          surname: nameFlowState.userSurname
        )
        state.destination = nil
        userDefaultsClient.create(model: state.user)
        
        return .none
        
      case .destination:
        return .none
        
      case .onChangeNameTapped:
        let nameFlow = NameFlow.State(
          name: state.user.name,
          surname: state.user.surname
        )
        state.destination = .nameFlow(nameFlow)
        return .none
      }
    }
    .ifLet(\.$destination, action: \.destination) {
      Destination()
    }
  }
  
  @Reducer
  public struct Destination {
    @ObservableState
    public enum State: Equatable {
      case nameFlow(NameFlow.State)
    }

    public enum Action {
      case nameFlow(NameFlow.Action)
    }

    public var body: some Reducer<State, Action> {
      Scope(state: \.nameFlow, action: \.nameFlow) {
        NameFlow()
      }
    }
  }
}
