 //
//  ContentView.swift
//  WeatherApp
//
//  Created by Esther Ramos on 01/08/22.
//

import SwiftUI

struct ContentView: View {
    //the reason why youre using state  its because structs are value typed so they dont hold state, they get destroyed and recreated. How can u make a struct hold state? This var keeps state
    @State private var isNight = false
    
    
    
    var body: some View {
        ZStack{
            //if its night then black (: means false) and if false we'll do blue
            //what bing does is, is night variable on my backgroundview is always the same as this isNight var. to do that, you put a dolar signt to it.
            BackgroundView(isNight: $isNight)
            
            VStack {
                CityTextView(cityName: "Cupertino, CA")
            
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill": "cloud.sun.fill", temperature: 76)
                
                HStack (spacing: 20) {
                    WeatherdayView(dayOfWeek: "TUE",
                                   imageName: "cloud.sun.fill",
                                   temperature: 74 )
                    WeatherdayView(dayOfWeek: "WED",
                                   imageName: "sun.max.fill",
                                   temperature: 88 )
                    WeatherdayView(dayOfWeek: "THU",
                                   imageName: "wind.snow",
                                   temperature: 55 )
                    WeatherdayView(dayOfWeek: "FRI",
                                   imageName: "sunset.fill",
                                   temperature: 60 )
                    WeatherdayView(dayOfWeek: "SAT",
                                   imageName: "snow",
                                   temperature: 25 )
                }

                Spacer()
                
                Button {
                    //when i tap the buttom, is going to toggle between true and false (command in line 16)
                    isNight.toggle()
                    
                } label: {
                    WeatherButton(title: "Change Day Time",
                                  textColor: .blue, backgroundColor: .white)
                }
                Spacer()
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



//Extract View from the VStack (click + command)

struct WeatherdayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium, design: .default))
                .foregroundColor(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40)
            
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
  
    @Binding var isNight: Bool
    
    var body : some View {
        
        
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightblue")]),
                       startPoint: .topLeading,
                       endPoint:.bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var temperature: Int
    
    var body: some View {
            
            VStack(spacing: 8) {
                Image(systemName: imageName)
                    .renderingMode(.original)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 180, height: 180)
                
            Text("\(temperature)°")
                    .font(.system(size: 70, weight: .medium))
                    .foregroundColor(.white)
                
            }
            .padding(.bottom, 40)
        
        }
    }

       
