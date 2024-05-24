import ComposableArchitecture
import SwiftUI

struct PageView<V>: View where V: View {
  let content: V
  
  init(@PageBuilder content: () -> V) {
    self.content = content()
  }
  
  var body: some View {
    content
  }
}
