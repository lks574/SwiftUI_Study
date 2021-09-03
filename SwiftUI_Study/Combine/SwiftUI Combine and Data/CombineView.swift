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
        content
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

  var content: some View {
    VStack {
      ProfileRow()
      
      VStack {
        NavigationLink(destination: FAQView()) {
          MenuRow()
        }

        divider

        NavigationLink(destination: PackagesView()) {
          MenuRow(title: "SwiftUI Packages", leftIcon: "square.stack.3d.up.fill")
        }

        divider

        Link(destination: URL(string: "https://www.apple.com")!, label: {
          MenuRow(title: "YouTube Channel", leftIcon: "play.rectangle.fill", rightIcon: "link")
        })

      }
      .blurBackground()
      .padding(.top, 20)

      Text("Version 1.00")
        .foregroundColor(.white.opacity(0.7))
        .padding(.top, 20)
        .padding(.horizontal, 20)
        .padding(.bottom, 10)
        .font(.footnote)
    }
    .foregroundColor(.white)
    .padding(.top, 20)
    .padding(.horizontal, 20)
    .padding(.bottom, 10)
  }

  var divider: some View {
    Divider().background(Color.white.blendMode(.overlay))
  }
}

struct CombineView_Previews: PreviewProvider {
  static var previews: some View {
    CombineView()
  }
}
