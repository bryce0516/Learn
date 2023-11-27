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
