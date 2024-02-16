import BirthdateFeature
import ComposableArchitecture
import Foundation
import Models
import NameFlowFeature
import OnboardingCompletionFeature

@Reducer
public struct OnboardingFlow {
  @ObservableState
  public struct State: Equatable {
    var path = StackState<Path.State>()
    public internal(set) var user: User?
    
    public init() {}
  }
  
  public enum Action {
    case onProceedTapped
    case path(StackAction<Path.State, Path.Action>)
  }
  
  public init() {}
  
  public var body: some ReducerOf<Self> {
    Reduce { state, action in
      switch action {
      case .onProceedTapped:
        state.path.append(.birthdate(Birthdate.State()))
        return .none
                
      case let .path(.element(id, .birthdate(.onProceedTapped))):
        guard case let .some(.birthdate(birthdateState)) = state.path[id: id]
        else { return .none }
        
        state.user = User(
          birthdate: birthdateState.date
        )
        
        let diffComponents = Calendar.current.dateComponents([.year], from: birthdateState.date, to: Date())
        if let year = diffComponents.year, year >= 18 {
          state.path.append(.nameFlow(NameFlow.State(name: "")))
        } else {
          state.path.append(.onboardingCompletion(OnboardingCompletion.State()))
        }

        return .none
        
      case let .path(.element(id, .nameFlow(.root(.nameCompletion(.onProceedTapped))))):
        guard case let .some(.nameFlow(nameFlowState)) = state.path[id: id],
              let birthdate = state.user?.birthdate
        else { return .none }
        
        state.user = User(
          birthdate: birthdate,
          name: nameFlowState.name,
          surname: nameFlowState.surname
        )
        
        state.path.append(.onboardingCompletion(OnboardingCompletion.State()))
        return .none
                
      case .path:
        return .none
      }
    }
    .forEach(\.path, action: \.path) {
      Path()
    }
  }
  
  @Reducer
  public struct Path {
    @ObservableState
    public enum State: Equatable {
      case birthdate(Birthdate.State)
      case nameFlow(NameFlow.State)
      case onboardingCompletion(OnboardingCompletion.State)
    }

    public enum Action {
      case birthdate(Birthdate.Action)
      case nameFlow(NameFlow.Action)
      case onboardingCompletion(OnboardingCompletion.Action)
    }

    public var body: some Reducer<State, Action> {
      Scope(state: \.birthdate, action: \.birthdate) {
        Birthdate()
      }
      Scope(state: \.nameFlow, action: \.nameFlow) {
        NameFlow()
      }
      Scope(state: \.onboardingCompletion, action: \.onboardingCompletion) {
        OnboardingCompletion()
      }
    }
  }
}
