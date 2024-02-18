import ComposableArchitecture
import SwiftUI

public struct NameCompletionView: View {
  let store: StoreOf<NameCompletion>
  
  public init(store: StoreOf<NameCompletion>) {
    self.store = store
  }

  public var body: some View {
    WithPerceptionTracking {
      VStack {
        Text("Completion of name flow!")
        
        Button("Proceed") {
          store.send(.onProceedTapped)
        }
        .buttonStyle(.borderedProminent)
      }
      .padding()
      .navigationBarBackButtonHidden()
      .toolbar {
        ToolbarItem(placement: .navigationBarLeading) {
          BackButton {
            store.send(.backButtonTapped, animation: .default)
          }
        }
      }

    }
  }
}

#Preview {
  NameCompletionView(
    store: Store(
      initialState: NameCompletion.State()) {
        NameCompletion()
      }
  )
}
