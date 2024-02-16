import ComposableArchitecture
import SwiftUI

public struct BirthdateView: View {
  @Perception.Bindable var store: StoreOf<Birthdate>
  
  public init(store: StoreOf<Birthdate>) {
    self.store = store
  }

  public var body: some View {
    WithPerceptionTracking {
      VStack {
        Text("Enter your birthday")
          .font(.largeTitle)
        
        DatePicker(
          selection: $store.date,
          in: ...Date.now,
          displayedComponents: .date
        ) {
          Text("Select a date")
        }
        .onChange(of: store.date) { _ in
          store.send(.onDateSelected)
        }
        
        Button("Proceed") {
          store.send(.onProceedTapped)
        }
        .buttonStyle(.borderedProminent)
        .disabled(!store.isProceedEnabled)
      }
      .padding()
    }
  }
}

#Preview {
  BirthdateView(
    store: Store(
      initialState: Birthdate.State()) {
        Birthdate()
    }
  )
}
