//
//  SwiftUIHandBook.swift
//  SwiftUI_Study
//
//  Created by kyungseok.lee_Flitto on 2021/08/27.
//

import SwiftUI

struct SwiftUIHandBook: View {

  @State var show = false
  @State var transition = false

  var body: some View {
    ScrollView {
      ZStack {
        Color(#colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)).ignoresSafeArea(.all)
        ZStack {
          VStack {
            VStack {
              ZStack {
                Color.black
                  .opacity(show ? 0.5 : 0.2)
                RoundedRectangle(cornerRadius: 40)
                  .foregroundColor(.white)
                  .frame(height: 300)
                  .opacity(show ? 1 : 0.5)
                  .padding(show ? 16 :32)
                  .offset(y: show ? 0 : 30)
                  .animation(.spring(response: 0.4, dampingFraction: 0.4))
                RoundedRectangle(cornerRadius: 40)
                  .frame(height: 300)
                  .offset(y: show ? 1000 : 0)
                  .foregroundColor(.white)
                  .shadow(radius: 40)
                  .padding()
                  .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
              }
              .onTapGesture {
                show.toggle()
              }
            }

            VStack {
              Text("View Transition")
                .padding()
                .foregroundColor(.white)
                .background(Capsule().stroke())
              if transition {
                RoundedRectangle(cornerRadius: 30)
                  .fill(Color.yellow)
                  .padding()
                  .transition(.scale)
              }
            }
            .onTapGesture {
              withAnimation(.spring()) {
                transition.toggle()
              }
            }

            VStack {
              Text("Animation").bold().foregroundColor(.white)
            }
            .frame(width: show ? CGFloat(320) : CGFloat(300), height: show ? CGFloat(100) : CGFloat(44))
            .background(Color.blue)
            .cornerRadius(30)
            .shadow(color: Color.blue.opacity(0.5), radius: 20)
            .onTapGesture {
              withAnimation(.spring()) {
                show.toggle()
              }
            }

            TabView {
              RoundedRectangle(cornerRadius: 30)
                .fill(Color.blue)
                .padding()
              RoundedRectangle(cornerRadius: 30)
                .fill(Color.red)
                .padding()
              RoundedRectangle(cornerRadius: 30)
                .fill(Color.purple)
                .padding()
            }
            .frame(width: .infinity, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
            .cornerRadius(30)
            .tabViewStyle(PageTabViewStyle())

            ZStack {
              Color.blue.ignoresSafeArea()
              VStack {
                Text("SwiftUI for ios 14").bold()
              }
              .frame(width: 300, height: 200)
              .background(Color.white)
              .clipShape(RoundedRectangle(cornerRadius: 25.0, style: .continuous))
            }
            VStack {
              ForEach(0..<5) { item in
                Text("Mask and Transparency")
                  .font(.title3).bold()
                  .frame(maxWidth: .infinity, alignment: .leading)
              }
            }
            .padding()
            .background(Color.white)
            .mask(LinearGradient(gradient: Gradient(colors: [Color.red, Color.blue.opacity(0)]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(30)

            VStack(alignment: .center, spacing: 5) {
              ZStack {
                Circle()
                  .stroke(Color.black, lineWidth: 2)
                  .frame(width: 44.0, height: 44.0)
                Image(systemName: "xmark")
                  .renderingMode(.original)
                  .imageScale(.large)
                  .font(.system(size: 16, weight: .bold))
              }
              Text("SwiftUI for iOS 14")
                .font(.title2)
                .fontWeight(.bold)
                .foregroundColor(Color.white)
              Text("20 video sasdasdasdasd\n asdasdasdasdaa\n asdasdqwdqwd")
                .font(.system(size: 20, weight: .semibold, design: .serif))
                .lineLimit(2)
                .multilineTextAlignment(.center)
                .lineSpacing(5.0)
              Text("Font Test")
                .font(.custom("OpenSans-Bold", size: 15))
                .foregroundColor(Color.yellow)
              Image("Illustration")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .background(Circle().stroke())
                .frame(width: 200, height: 200, alignment: .center)
              Capsule()
                .foregroundColor(Color.blue)
                .frame(height: 44)
                .overlay(
                  Text("Swift")
                )
            }
            
            .padding(.all)
            .background(Color.purple)
            .cornerRadius(20.0)
          }
        }
        .padding()
        .toolbar(content: {
          ToolbarItemGroup(placement: .bottomBar) {
            Image(systemName: "person")
            Spacer()
            HStack {
              Image(systemName: "ellipsis")
              Divider()
              Image(systemName: "trash")
                .frame(width: 32, height: 32)
                .background(Color.blue)
                .mask(Circle())
            }

          }
        })
      }
      .navigationTitle("Learn")
    }
  }
}

struct SwiftUIHandBook_Previews: PreviewProvider {
  static var previews: some View {
    SwiftUIHandBook()
  }
}
