import ComposableArchitecture
import SwiftUI

struct PanelPair<PageType: Comparable, LeftContent: View, RightContent: View>: View {
  private let leftPage: PageType
  private let selectedPage: PageType
  
  private let leftContent: () -> LeftContent
  private let rightContent: () -> RightContent
  
  init(
    leftPage: PageType,
    selectedPage: PageType,
    leftContent: @escaping () -> LeftContent,
    rightContent: @escaping () -> RightContent
  ) {
    self.leftPage = leftPage
    self.selectedPage = selectedPage
    self.leftContent = leftContent
    self.rightContent = rightContent
  }
  
  var body: some View {
    WithPerceptionTracking {
      ZStack {
        if selectedPage <= leftPage {
          leftContent()
            .modifier(TransitionLeading())
        } else {
          rightContent()
            .modifier(TransitionTrailing())
        }
      }
    }
  }
}
