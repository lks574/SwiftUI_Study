//
//  MenuContentView.swift
//  SwiftUI_Study
//
//  Created by kyungseok.lee_Flitto on 2021/08/27.
//

import SwiftUI

struct MenuContentView: View {

  var body: some View {
    NavigationView {
      List {
        NavigationLink(
          destination: SwiftUIHandBook(),
          label: {
            Text("SwiftUI Handbook")
          }
        )
        NavigationLink(
          destination: CombineView(),
          label: {
            Text("SwiftUI Combine and Data")
          }
        )
      }
      .navigationBarTitle("SwiftUI - 스터디")
      .navigationViewStyle(StackNavigationViewStyle())
    }

  }
}

struct MenuContentView_Previews: PreviewProvider {
  static var previews: some View {
    MenuContentView()
  }
}
