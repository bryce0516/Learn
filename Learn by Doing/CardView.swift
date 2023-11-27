//
//  CardView.swift
//  Learn by Doing
//
//  Created by Hye Sung Park on 11/27/23.
//

import SwiftUI

struct CardView: View {
  // MARK: - PROPERTIES
  
  var gradient: [Color] = [Color("Color01"), Color("Color02")]
  
  // MARK: - CARD
  var body: some View {
    ZStack {
      Image("developer-no1")
      
      VStack {
        Text("SwfitUI")
          .font(.largeTitle)
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
          .foregroundStyle(Color.white)
        Text("Better apps. Less code.")
          .fontWeight(.light)
          .foregroundColor(Color.white)
          .italic()
      }
      .offset(y: -218)
      
      Button(action: {
        print("Button was tapped")
      }, label: {
        HStack {
          Text("Learn".uppercased())
            .fontWeight(.heavy)
            .foregroundStyle(Color.white)
            .accentColor(Color.white)
          
          Image(systemName: "arrow.right.circle")
            .font(Font.title.weight(.medium))
            .accentColor(Color.white)
          
        }
        .padding(.vertical)
        .padding(.horizontal, 24)
        .background(
          LinearGradient(
            gradient: Gradient(colors: gradient),
            startPoint: .leading,
            endPoint: .trailing)
        )
        .clipShape(Capsule())
        .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
      })
      .offset(y: 210)
    }
    .frame(width: 335, height: 545)
    .background(
      LinearGradient(
        gradient: Gradient(colors: gradient), 
        startPoint: .topLeading, 
        endPoint: .bottom
      )
    )
    .cornerRadius(16)
    .shadow(radius: 8)
  }
}

#Preview {
  CardView()
    .previewLayout(.sizeThatFits)
}
