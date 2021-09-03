//
//  MenuContentView.swift
//  SwiftUI_Study
//
//  Created by kyungseok.lee_Flitto on 2021/08/27.
//

import SwiftUI

struct MenuContentView: View {
  @Environment(\.colorScheme) var colorScheme: ColorScheme

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
    }
    .navigationViewStyle(StackNavigationViewStyle())
    .accentColor(colorScheme == .dark ? .white : Color(#colorLiteral(red: 0.1764705926, green: 0.01176470611, blue: 0.5607843399, alpha: 1)))


  }
}

struct MenuContentView_Previews: PreviewProvider {
  static var previews: some View {
    MenuContentView()
  }
}
