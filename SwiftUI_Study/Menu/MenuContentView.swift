//
//  MenuContentView.swift
//  SwiftUI_Study
//
//  Created by kyungseok.lee_Flitto on 2021/08/27.
//

import SwiftUI

struct MenuContentView: View {

  let next: [MenuItem] = [
    .init(title: "SwiftUI Handbook", nextView: SwiftUIHandBook())
  ]

  var body: some View {
    NavigationView {
      List {
        ForEach(next) { item in
          NavigationLink(
            destination: item.nextView,
            label: {
              Text(item.title)
            }
          )
        }
      }
      .navigationBarTitle("SwiftUI - 스터디")
    }
  }
}

struct MenuContentView_Previews: PreviewProvider {
  static var previews: some View {
    MenuContentView()
  }
}

struct MenuItem: Identifiable {
  var id = UUID()
  var title: String
  var nextView: SwiftUIHandBook
}
