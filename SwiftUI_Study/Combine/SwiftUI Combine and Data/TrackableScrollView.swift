//
//  TrackableScrollView.swift
//  SwiftUI_Study
//
//  Created by kyungseok.lee_Flitto on 2021/09/02.
//

import SwiftUI

struct TrackableScrollView<Content: View>: View {

  let axes: Axis.Set
  let offsetChanged: (CGPoint) -> Void
  let content: Content

  init(axes: Axis.Set = .vertical, offsetChanged: @escaping (CGPoint) -> Void = { _ in }, @ViewBuilder content: () -> Content) {
    self.axes = axes
    self.offsetChanged = offsetChanged
    self.content = content()
  }

  var body: some View {
    SwiftUI.ScrollView(axes) {
      GeometryReader { geometry in
        Color.clear.preference(
          key: ScrollOffestPreferenceKey.self,
          value: geometry.frame(in: .named("scrollView")).origin
        )
      }
      .frame(width: 0, height: 0)

      content
    }
    .coordinateSpace(name: "scrollView")
    .onPreferenceChange(ScrollOffestPreferenceKey.self, perform: offsetChanged)
  }
}

private struct ScrollOffestPreferenceKey: PreferenceKey {
  static var defaultValue: CGPoint = .zero

  static func reduce(value: inout CGPoint, nextValue: () -> CGPoint) {}
}
