import ComposableArchitecture
import SwiftUI

public struct NameFlowView: View {
  let store: StoreOf<NameFlow>
  
  public init(store: StoreOf<NameFlow>) {
    self.store = store
  }
  
  public var body: some View {
    WithPerceptionTracking {
      PanelPair(
        leftPage: NameFlow.Page.name,
        selectedPage: store.selectedPage,
        leftContent: {
          NameView(
            store: store.scope(
              state: \.name,
              action: \.name
            )
          )
        },
        rightContent: {
          PanelPair(
            leftPage: NameFlow.Page.surname,
            selectedPage: store.selectedPage,
            leftContent: {
              SurnameView(
                store: store.scope(
                  state: \.surname,
                  action: \.surname
                )
              )
            },
            rightContent: {
              NameCompletionView(
                store: store.scope(
                  state: \.nameCompletion,
                  action: \.nameCompletion
                )
              )
            }
          )
        }
      )
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
