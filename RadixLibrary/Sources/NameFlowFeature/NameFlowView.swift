import ComposableArchitecture
import SwiftUI

public struct NameFlowView: View {
  let store: StoreOf<NameFlow>
  
  public init(store: StoreOf<NameFlow>) {
    self.store = store
  }
  
  public var body: some View {
    WithPerceptionTracking {
      Group {
        switch self.store.root {
        case .name:
          if let store = self.store.scope(
            state: \.root.name,
            action: \.root.name
          ) {
            NameView(store: store)
          }
          
        case .nameCompletion:
          if let store = self.store.scope(
            state: \.root.nameCompletion,
            action: \.root.nameCompletion
          ) {
            NameCompletionView(store: store)
          }
          
        case .surname:
          if let store = self.store.scope(
            state: \.root.surname,
            action: \.root.surname
          ) {
            SurnameView(store: store)
          }
        }
      }
      .animation(.easeInOut, value: store.root)
      .transition(
        .asymmetric(
          insertion: .move(edge: .trailing),
          removal: .move(edge: .leading)
        )
      )
    }
  }
}

#Preview {
  NameFlowView(
    store: Store(
      initialState: NameFlow.State(name: "")) {
        NameFlow()
      }
  )
}
