//
//  ContentView.swift
//  WeatherAppSwiftUI
//
//  Created by Octav Radulian on 14.06.2023.
//

import SwiftUI

struct ContentView: View {
  
  //we update the UI based on a source of truth
  @State private var isNight = false
  
  var body: some View {
    
    ZStack {
      
      BackgroundView(isNight: $isNight)
      
      VStack {
        
        CityTextView(cityName: "Cupertino, CA")
        
        MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", temperature: 76)
        
        HStack(spacing: 30) {
          DayContentView(dayName: "TUE", weatherCondition: "cloud.sun.fill", degrees: 74)
          DayContentView(dayName: "WED", weatherCondition: "cloud.rain.fill", degrees: 74)
          DayContentView(dayName: "THU", weatherCondition: "sun.max.fill", degrees: 74)
          DayContentView(dayName: "FRI", weatherCondition: "cloud.drizzle.fill", degrees: 74)
          DayContentView(dayName: "SAT", weatherCondition: "cloud.bolt.fill", degrees: 74)
        }
        .padding(.top, 5)
        
        Button {
          print("Tapped")
          isNight.toggle()
        } label: {
          WeatherButton(title: "Change Day Time",
                        backgroundColor: .white,
                        textColor: .blue)
        }
        .padding(.top, 90)
        
        
        Spacer()
        
      }
    }
    
  }
}

struct DayContentView: View {
  
  var dayName: String
  var weatherCondition: String
  var degrees: Int
  
  var body: some View {
    VStack {
      Text(dayName)
        .font(.body)
        .foregroundColor(.white)
      Image(systemName: weatherCondition)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 40, height: 40)
      Text("\(degrees)°")
        .font(.body)
        .foregroundColor(.white)
    }
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}

struct BackgroundView: View {
  
  @Binding var isNight: Bool
  
  //we move the logic here
  
  var body: some View {
    LinearGradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("gradientColor")], startPoint: .topLeading, endPoint: .bottomTrailing)
      .ignoresSafeArea()
  }
}

struct CityTextView: View {
  
  var cityName: String
  
  var body: some View {
    Text(cityName)
      .font(.largeTitle)
      .foregroundColor(.white)
      .padding(.top)
  }
}

struct MainWeatherStatusView: View {
  
  var imageName: String
  var temperature: Int
  
  var body: some View {
    VStack {
      Image(systemName: imageName)
        .renderingMode(.original)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: 200, height: 200)
      
      Text("\(temperature)°")
        .font(.system(size: 70, weight: .medium))
        .foregroundColor(.white)
        .padding(.top)
    }
  }
}


