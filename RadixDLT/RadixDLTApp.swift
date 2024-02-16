import AppCoreFeature
import ComposableArchitecture
import SwiftUI

@main
struct RadixDLTApp: App {
  var body: some Scene {
    WindowGroup {
      AppCoreView(
        store: Store(initialState: AppCore.State()) {
          AppCore()
        }
      )
    }
  }
}
