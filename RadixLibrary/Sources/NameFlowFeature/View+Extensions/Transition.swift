import SwiftUI

struct TransitionLeading: ViewModifier {
  func body(content: Content) -> some View {
    content.transition(.move(edge: .leading))
  }
}

struct TransitionTrailing: ViewModifier {
  func body(content: Content) -> some View {
    content.transition(.move(edge: .trailing))
  }
}
