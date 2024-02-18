import ComposableArchitecture
import SwiftUI

public struct NameView: View {
  @Perception.Bindable var store: StoreOf<Name>
  
  public init(store: StoreOf<Name>) {
    self.store = store
  }

  public var body: some View {
    WithPerceptionTracking {
      VStack(spacing: 16) {
        TextField("Please enter your name", text: $store.name)
          .textFieldStyle(.roundedBorder)
          .autocorrectionDisabled()
        
        Button("Proceed") {
          store.send(.onProceedTapped, animation: .default)
        }
        .buttonStyle(.borderedProminent)
        .disabled(!store.isProceedEnabled)
      }
      .padding()
    }
  }
}

#Preview {
  NameView(
    store: Store(
      initialState: Name.State(
        name: ""
      )
    ) {
      Name()
    }
  )
}
