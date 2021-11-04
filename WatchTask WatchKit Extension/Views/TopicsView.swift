//
//  TopicsView.swift
//  WatchTask WatchKit Extension
//
//  Created by Кристина Перегудова on 04.11.2021.
//

import SwiftUI

extension Color {
  static var random: Color {
    return Color(
      red: .random(in: 0...1),
      green: .random(in: 0...1),
      blue: .random(in: 0...1)
    )
  }
}

struct TopicsView: View {
  static let rows = 5
  var images = ["camera", "heart", "video", "menucard", "globe.europe.africa", "snowflake", "person"]
  let gridItems = Array(repeating: GridItem(.fixed(37), spacing: 12, alignment: .center),
                        count: rows)
  @State var isActive: Bool = false
  
  var body: some View {
    ScrollView([.horizontal, .vertical], showsIndicators: false) {
      LazyVGrid(columns: gridItems, alignment: .center, spacing: 6) {
        ForEach(0..<20) { value in
          Image(systemName: images[value % images.count])
            .foregroundColor(.white)
            .frame(width: 24, height: 24)
            .frame(width: 37, height: 37)
            .background(RadialGradient(colors: [.random, .random], center: .center,
                                       startRadius: 0, endRadius: 20))
            .clipShape(Circle())
            .offset(x: offsetX(value), y: 0)
            .opacity(value % (TopicsView.rows * 2) == (TopicsView.rows - 1) ? 0 : 1)
            .onTapGesture {
              isActive.toggle()
            }
        }
      }
    }.navigationTitle {
      Text("Topics")
        .frame(maxWidth: .infinity, alignment: .leading)
        .font(.system(size: 20))
        .foregroundColor(.gray)
    }.navigationBarBackButtonHidden(true)
      .background(
        NavigationLink(isActive: $isActive) {
          FeedView()
        } label: {
          EmptyView()
        }.hidden()
      )
  }
  
  func offsetX(_ value: Int) -> CGFloat {
    let rowNumber = value / gridItems.count
    if rowNumber % 2 == 0 {
      return 37/2 + 6/2
    }
    return 0
  }
}
