//
//  ExerciseView.swift
//  WatchTask WatchKit Extension
//
//  Created by Кристина Перегудова on 04.11.2021.
//

import SwiftUI

extension Color {
  static let lightGreen = Color(UIColor(red: 0.667, green: 0.957, blue: 0.122, alpha: 1))
}

struct ExerciseView: View {
  let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
  @State var secondsLeft = 30
  
  var body: some View {
    VStack {
      ZStack(alignment: .center) {
        Circle()
          .stroke(lineWidth: 20)
          .foregroundColor(.lightGreen.opacity(0.3))
        Circle()
          .trim(from: 0.0, to: CGFloat(secondsLeft) / 30.0)
          .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
          .foregroundColor(.lightGreen)
          .rotationEffect(Angle(degrees: 270.0))
          .animation(.easeInOut, value: secondsLeft)
        
        VStack {
          Text("\(secondsLeft)")
            .font(.system(size: 48))
            .foregroundColor(.white)
          Text("OF 30 SEC")
            .font(.system(size: 12))
            .foregroundColor(.white)
        }
      }.frame(width: 140, height: 140)
        .onTapGesture {
          if secondsLeft > 0 {
            secondsLeft = 0
          } else {
            secondsLeft = 30
          }
        }
    }.onReceive(timer) { _ in
      if secondsLeft > 0 {
        secondsLeft -= 1
      }
    }
    .navigationBarBackButtonHidden(true)
    .navigationTitle {
      Text("Exercise")
        .font(.system(size: 17))
        .frame(maxWidth: .infinity, alignment: .leading)
        .foregroundColor(.lightGreen)
    }
  }
}
