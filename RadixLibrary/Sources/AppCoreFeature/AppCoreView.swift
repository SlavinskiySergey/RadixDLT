import ComposableArchitecture
import HomeFlowFeature
import OnboardingFlowFeature
import SplashFeature
import SwiftUI

public struct AppCoreView: View {
  let store: StoreOf<AppCore>

  public init(store: StoreOf<AppCore>) {
    self.store = store
  }

  public var body: some View {
    WithPerceptionTracking {
      switch self.store.state {
      case .homeFlow:
        if let store = self.store.scope(state: \.homeFlow, action: \.homeFlow) {
          NavigationStack {
            HomeFlowView(store: store)
          }
        }
        
      case .onboardingFlow:
        if let store = self.store.scope(state: \.onboardingFlow, action: \.onboardingFlow) {
          OnboardingFlowView(store: store)
        }
        
      case .splash:
        if let store = self.store.scope(state: \.splash, action: \.splash) {
          SplashView(store: store)
        }
      }
    }
  }
}

#Preview {
  AppCoreView(
    store: Store(
      initialState: AppCore.State()) {
      AppCore()
    }
  )
}
