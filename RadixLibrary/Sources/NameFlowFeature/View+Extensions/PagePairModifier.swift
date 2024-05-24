import SwiftUI

struct PagePairModifier<LeftContent: View>: ViewModifier {
  let isLeftActive: Bool
  let leftContent: () -> LeftContent
  
  func body(content: Content) -> some View {
    ZStack {
      if isLeftActive {
        leftContent()
          .modifier(TransitionLeading())
      } else {
        content
          .modifier(TransitionTrailing())
      }
    }
  }
}
