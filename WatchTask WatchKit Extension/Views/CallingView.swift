//
//  CallingView.swift
//  WatchTask WatchKit Extension
//
//  Created by Кристина Перегудова on 04.11.2021.
//

import SwiftUI

extension Color {
  static let accentGreen = Color(UIColor(red: 0.47, green: 1, blue: 0.281, alpha: 0.5))
}

struct CallingView: View {
  @State var isActive: Bool = false
  @State var animationAmount: CGFloat = 0
  
  var body: some View {
    VStack {
      Image("syl")
        .resizable()
        .frame(width: 60, height: 60)
        .clipShape(Circle())
      Text("Sylvie")
        .foregroundColor(.white)
        .font(.system(size: 20))
        .padding(.top, 5)
      Text("Incoming Call")
        .foregroundColor(.accentGreen)
        .font(.system(size: 12))
      HStack {
        Image(systemName: "phone.down.fill")
          .resizable()
          .scaledToFit()
          .frame(width: 25, alignment: .center)
          .frame(width: 50, height: 50)
          .background(Color.accentRed)
          .clipShape(Circle())
          .rotationEffect(Angle(degrees: animationAmount - 15))
          .animation(.easeInOut.repeatForever().speed(2.5),
                     value: animationAmount)
          .onTapGesture {
            isActive.toggle()
          }
        Spacer()
        Image(systemName: "phone.fill")
          .resizable()
          .frame(width: 25, height: 25, alignment: .center)
          .frame(width: 50, height: 50)
          .background(Color.accentGreen)
          .clipShape(Circle())
          .rotationEffect(Angle(degrees: animationAmount))
          .animation(.easeInOut.repeatForever().speed(2),
                     value: animationAmount)
          .onTapGesture {
            isActive.toggle()
          }
      }.padding(.top, 11)
        .onAppear {
          animationAmount = 30
        }
    }.padding(.horizontal, 20)
      .navigationBarHidden(true)
      .background(
        NavigationLink(isActive: $isActive) {
          TopicsView()
        } label: {
          EmptyView()
        }.hidden()
      )
  }
}
