import ComposableArchitecture
import SwiftUI

public struct SurnameView: View {
  @Perception.Bindable var store: StoreOf<Surname>
  
  public init(store: StoreOf<Surname>) {
    self.store = store
  }

  public var body: some View {
    WithPerceptionTracking {
      VStack(spacing: 16) {
        TextField("Please enter your surname", text: $store.surname)
          .textFieldStyle(.roundedBorder)
          .autocorrectionDisabled()
        
        Button("Proceed") {
          store.send(.onProceedTapped, animation: .default)
        }
        .buttonStyle(.borderedProminent)
        .disabled(!store.isProceedEnabled)
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
  SurnameView(
    store: Store(
      initialState: Surname.State(
        surname: ""
      )
    ) {
      Surname()
    }
  )
}
