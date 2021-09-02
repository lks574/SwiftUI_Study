//
//  CombineView.swift
//  SwiftUI_Study
//
//  Created by kyungseok.lee_Flitto on 2021/09/02.
//

import SwiftUI

struct CombineView: View {
  @State private var contentOffset = CGFloat(0)
  var body: some View {
    ZStack(alignment: .top) {
      TrackableScrollView(offsetChanged: { offset in
        contentOffset = offset.y
      }) {
        Text("Hello World!")
          .padding()
      }

      VisualEffectBlur(blurStyle: .systemMaterial)
        .opacity(contentOffset < -16 ? 1: 0)
        .animation(.easeIn)
        .ignoresSafeArea()
        .frame(height: 0)
    }
    .frame(maxHeight: .infinity, alignment: .top)
    .background(AccountBackground())
    .navigationBarHidden(true)
  }
}

struct CombineView_Previews: PreviewProvider {
  static var previews: some View {
    CombineView()
  }
}
