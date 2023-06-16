//
//  WeatherButton.swift
//  WeatherAppSwiftUI
//
//  Created by Octav Radulian on 16.06.2023.
//

import SwiftUI

struct WeatherButton: View {
  
  var title: String
  var backgroundColor: Color
  var textColor: Color
  
  
  var body: some View {
    Text(title)
      .frame(width: 280, height: 50)
      .background(backgroundColor)
      .foregroundColor(textColor)
      .font(.system(size: 20, weight: .bold, design: .default))
      .cornerRadius(10)
  }
}

struct WeatherButton_Previews: PreviewProvider {
    static var previews: some View {
      WeatherButton(title: "test", backgroundColor: .blue, textColor: .white)
    }
}
