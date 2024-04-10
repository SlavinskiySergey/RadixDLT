import ComposableArchitecture
import SwiftUI

public struct OnboardingCompletionView: View {
  let store: StoreOf<OnboardingCompletion>
  
  public init(store: StoreOf<OnboardingCompletion>) {
    self.store = store
  }

  public var body: some View {
    WithPerceptionTracking {
      VStack {
        Text("Completion of onboarding flow!")
        
        Button("Save") {
          store.send(.onSaveTapped)
        }
        .buttonStyle(.borderedProminent)
      }
    }
  }
}

#Preview {
  OnboardingCompletionView(
    store: Store(
      initialState: OnboardingCompletion.State()) {
      OnboardingCompletion()
    }
  )
}
