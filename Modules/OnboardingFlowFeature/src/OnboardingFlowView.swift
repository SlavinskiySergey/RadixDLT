import BirthdateFeature
import ComposableArchitecture
import NameFlowFeature
import OnboardingCompletionFeature
import SwiftUI

public struct OnboardingFlowView: View {
  @Perception.Bindable var store: StoreOf<OnboardingFlow>
  
  public init(store: StoreOf<OnboardingFlow>) {
    self.store = store
  }

  public var body: some View {
    WithPerceptionTracking {
      NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
        VStack(spacing: 32) {
          Text("Welcome!")

          Button("Proceed") {
            store.send(.onProceedTapped)
          }
          .buttonStyle(.borderedProminent)
        }
      } destination: { store in
        WithPerceptionTracking {
          switch store.state {
          case .birthdate:
            if let store = store.scope(state: \.birthdate, action: \.birthdate) {
              BirthdateView(store: store)
            }
            
          case .nameFlow:
            if let store = store.scope(state: \.nameFlow, action: \.nameFlow) {
              NameFlowView(store: store)
            }
            
          case .onboardingCompletion:
            if let store = store.scope(state: \.onboardingCompletion, action: \.onboardingCompletion) {
              OnboardingCompletionView(store: store)
            }
          }
        }
      }
    }
  }
}

#Preview {
  OnboardingFlowView(
    store: Store(
      initialState: OnboardingFlow.State()) {
      OnboardingFlow()
    }
  )
}
