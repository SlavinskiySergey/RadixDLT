import SwiftUI

struct PageTab<V: View> {
  let content: V
  let isLeftActive: Bool
  
  init(isLeftActive: Bool, @ViewBuilder content: () -> V) {
    self.content = content()
    self.isLeftActive = isLeftActive
  }
}

@resultBuilder
struct PageBuilder {
  static func buildPartialBlock<V>(first: PageTab<V>) -> V {
    first.content
  }
  
  static func buildPartialBlock<Accumulated, V>(
    accumulated: Accumulated,
    next: PageTab<V>
  ) -> ModifiedContent<Accumulated, PagePairModifier<V>> where Accumulated: View {
    accumulated
      .modifier(
        PagePairModifier(
          isLeftActive: next.isLeftActive,
          leftContent: { next.content }
        )
      )
  }
}
