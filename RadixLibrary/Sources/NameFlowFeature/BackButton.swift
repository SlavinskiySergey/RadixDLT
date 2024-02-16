import SwiftUI

struct BackButton: View {
  let action: () -> Void

  var body: some View {
    Button(action: action) {
      Image(systemName: "chevron.left")
        .scaleEffect(0.6)
        .font(Font.title.weight(.medium))
    }
  }
}

#Preview {
  BackButton {}
    .previewLayout(.sizeThatFits)
}
