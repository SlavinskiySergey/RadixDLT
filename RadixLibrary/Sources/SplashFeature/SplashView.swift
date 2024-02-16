import ComposableArchitecture
import SwiftUI

public struct SplashView: View {
  let store: StoreOf<Splash>
  
  public init(store: StoreOf<Splash>) {
    self.store = store
  }

  public var body: some View {
    WithPerceptionTracking {
      Text("Splash screen")
        .task { await store.send(.task).finish() }
    }
  }
}

#Preview {
  SplashView(
    store: Store(
      initialState: Splash.State()) {
        Splash()
      }
  )
}
