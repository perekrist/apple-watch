//
//  FeedView.swift
//  WatchTask WatchKit Extension
//
//  Created by Кристина Перегудова on 04.11.2021.
//

import SwiftUI

struct FeedView: View {
  @State var isActive: Bool = false
  
  var body: some View {
    VStack {
      TabView {
        ForEach(0..<10) { _ in
          RoundedRectangle(cornerRadius: 10)
            .foregroundColor(.random)
            .frame(maxWidth: .infinity, minHeight: 120, maxHeight: .infinity)
            .padding(.horizontal, 6)
        }
      }
      .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
      Spacer()
      HStack {
        VStack(spacing: 1) {
          Image(systemName: "heart")
            .foregroundColor(.white.opacity(0.8))
          Text("45")
            .font(.system(size: 8))
            .foregroundColor(.white.opacity(0.5))
        }.onTapGesture {
          isActive.toggle()
        }
        Spacer()
        VStack(spacing: 1) {
          Image(systemName: "bubble.left")
            .foregroundColor(.white.opacity(0.8))
          Text("5")
            .font(.system(size: 8))
            .foregroundColor(.white.opacity(0.5))
        }.onTapGesture {
          isActive.toggle()
        }
      }.padding(.horizontal, 20)
    }
    .navigationBarBackButtonHidden(true)
    .navigationTitle {
      Text("Feed")
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.system(size: 20))
        .foregroundColor(Color(UIColor(red: 0.871, green: 0, blue: 0.418, alpha: 1)))
    }.background(
      NavigationLink(isActive: $isActive) {
        ExerciseView()
      } label: {
        EmptyView()
      }.hidden()
    )
  }
}
