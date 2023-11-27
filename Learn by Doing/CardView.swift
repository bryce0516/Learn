//
//  CardView.swift
//  Learn by Doing
//
//  Created by Hye Sung Park on 11/27/23.
//

import SwiftUI

struct CardView: View {
  // MARK: - PROPERTIES
  var card: Card
  
  @State private var fadeIn: Bool = false
  @State private var moveDownward: Bool = false
  @State private var moveUpward: Bool = false
  
  var gradient: [Color] = [Color("Color01"), Color("Color02")]
  
  // MARK: - CARD
  var body: some View {
    ZStack {
      Image(card.imageName)
        .opacity(fadeIn ? 1.0 : 0.0)
      
      VStack {
        Text(card.title)
          .font(.largeTitle)
          .fontWeight(.heavy)
          .multilineTextAlignment(.center)
          .foregroundStyle(Color.white)
        Text(card.headline)
          .fontWeight(.light)
          .foregroundColor(Color.white)
          .italic()
      }
      .offset(y: moveDownward ? -218  : -300)
      
      Button(action: {
        print("Button was tapped")
        playSound(sound: "sound-chime", type: "mp3")
      }, label: {
        HStack {
          Text(card.callToAction.uppercased())
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
            gradient: Gradient(colors: card.gradientColors),
            startPoint: .leading,
            endPoint: .trailing)
        )
        .clipShape(Capsule())
        .shadow(color: Color("ColorShadow"), radius: 6, x: 0, y: 3)
      })
      .offset(y: moveUpward ? 210: 300)
    }
    .frame(width: 335, height: 545)
    .background(
      LinearGradient(
        gradient: Gradient(colors: card.gradientColors),
        startPoint: .topLeading,
        endPoint: .bottom
      )
    )
    .cornerRadius(16)
    .shadow(radius: 8)
    .onAppear {
      withAnimation(.linear(duration: 1.2)) {
        self.fadeIn.toggle()
      }
      withAnimation(.linear(duration: 0.8)) {
        self.moveDownward.toggle()
        self.moveUpward.toggle()
      }
    }
  }
}

#Preview {
  CardView(
    card: cardData[0]
  )
  .previewLayout(.sizeThatFits)
}
