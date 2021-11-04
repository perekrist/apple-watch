//
//  ContentView.swift
//  WatchTask WatchKit Extension
//
//  Created by Кристина Перегудова on 04.11.2021.
//

import SwiftUI

extension Color {
  static let accentRed = Color(UIColor(red: 1, green: 0.335, blue: 0.335, alpha: 1))
}

struct ContentView: View {
  @State var data: [(String, Int, String)] = [("Current", 63, "58 BPM, 3m ago"),
                                              ("Resting Rate", 56, "Today")]
  @State var animationAmount: CGFloat = 1
  
  var body: some View {
    List(data, id: \.1) { value in
      NavigationLink {
        CallingView()
      } label: {
        VStack(alignment: .leading, spacing: 5) {
          Text(value.0)
            .font(.system(size: 14))
            .foregroundColor(.white)
          HStack(alignment: .center, spacing: 8) {
            if value.0 == "Current" {
              Image(systemName: "heart.fill")
                .resizable()
                .foregroundColor(.accentRed)
                .frame(width: 20, height: 20)
                .scaleEffect(animationAmount)
                .animation(.easeInOut.repeatForever(autoreverses: true),
                           value: animationAmount)
                .onAppear {
                  animationAmount = 1.3
                }
            }
            HStack(alignment: .bottom, spacing: 0) {
              Text("\(value.1)")
                .font(.system(size: 30))
                .foregroundColor(.white)
              Text("BPM")
                .font(.system(size: 23))
                .foregroundColor(.accentRed)
                .padding(.bottom, 2)
            }
          }
          Text(value.2)
            .font(.system(size: 14))
            .foregroundColor(.white.opacity(0.5))
        }
      }
    }
    .navigationTitle {
      Text("Heart Rate")
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.system(size: 20))
        .foregroundColor(.accentRed)
    }
  }
}
