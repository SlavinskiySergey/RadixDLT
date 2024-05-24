import ComposableArchitecture
import SwiftUI

public struct NameFlowView: View {
  let store: StoreOf<NameFlow>
  
  public init(store: StoreOf<NameFlow>) {
    self.store = store
  }
  
  public var body: some View {
    WithPerceptionTracking {
      PageView {
        PageTab(
          isLeftActive: store.selectedPage <= .nameCompletion) {
            NameCompletionView(
              store: store.scope(
                state: \.nameCompletion,
                action: \.nameCompletion
              )
            )
          }
        
        PageTab(
          isLeftActive: store.selectedPage <= .surname) {
            SurnameView(
              store: store.scope(
                state: \.surname,
                action: \.surname
              )
            )
          }
        
        PageTab(
          isLeftActive: store.selectedPage <= .name) {
            NameView(
              store: store.scope(
                state: \.name,
                action: \.name
              )
            )
          }
      }
      .animation(.easeInOut, value: store.selectedPage)
    }
  }
}

#Preview {
  NavigationView {
    NameFlowView(
      store: Store(
        initialState: NameFlow.State(
          name: "Test_Name",
          surname: "Test_Surname"
        )
      ) {
        NameFlow()
      }
    )
  }
}
