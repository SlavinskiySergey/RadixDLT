import ComposableArchitecture
import Models
import NameFlowFeature
import SwiftUI

public struct HomeFlowView: View {
  @Perception.Bindable var store: StoreOf<HomeFlow>
  
  public init(store: StoreOf<HomeFlow>) {
    self.store = store
  }

  public var body: some View {
    WithPerceptionTracking {
      VStack(spacing: 16) {
        Text(store.user.birthdate, style: .date)
        
        if let fullName = store.fullName {
          Text(fullName)
        }
        
        Button {
          store.send(.onChangeNameTapped)
        } label: {
          Text("Update name")
        }
      }
      .navigationDestinationWrapper(
        item: $store.scope(
          state: \.destination?.nameFlow,
          action: \.destination.nameFlow
        )
      ) { store in
        NameFlowView(store: store)
      }
    }
  }
}

#Preview {
  NavigationStack {
    HomeFlowView(
      store: Store(
        initialState: HomeFlow.State(
          user: User(
            birthdate: Date(),
            name: "Name",
            surname: "Surname"
          )
        )
      ) {
        HomeFlow()
      }
    )
  }
}
