//
//  WeatherView.swift
//  weather
//
//  Created by user243761 on 11/19/23.
//

import SwiftUI

//display content of user location, show weather
struct WeatherView:View{
    var weather: ResponseBody //gets responseBody
    var body: some View{
        //Zstack
        ZStack(alignment:.leading){
            VStack{
                //display weather information
                VStack(alignment:.leading, spacing:5){
                    Text(weather.name)
                        .bold()
                        .font(.title)
                    
                    Text("Today, \(Date().formatted(.dateTime.month().day().hour().minute()))")
                        .fontWeight(.light)
                }
                .frame(maxWidth:.infinity,alignment:.leading)
                
                Spacer()
                
                VStack{
                    HStack{
                        VStack(spacing:20){
                            Image(systemName:"cloud")
                                .font(.system(size:40))
                            
                            Text("\(weather.weather[0].main)")
                        }
                        .frame(width:150, alignment:.leading)
                        Spacer()
                        Text(weather.main.feelsLike.roundDouble()+"*")
                            .font(.system(size:100))
                            .fontWeight(.bold)
                            .padding()
                    }
                    Spacer()
                        .frame(height:100)
                    AsyncImage(url: URL(string: "https://i.pinimg.com/originals/7d/ac/fa/7dacfae19e5229d546ef60f84e4174ea.png"
                                       )) { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode:.fit)
                            .frame(width:300, height:100)
                    }
                placeholder:{
                    ProgressView()
                }
                    Spacer()
                }
                .frame(maxWidth:.infinity, alignment:.trailing)
            }
            .padding()
            .frame(maxWidth:.infinity, alignment:.leading)
            
            VStack{
                Spacer()
                VStack(alignment:.leading,spacing:20){
                    Text("Weather Now")
                        .bold()
                        .padding(.bottom)
                    HStack {
                        WeatherRow(logo: "thermometer", name: "Min temp", value: (weather.main.tempMin.roundDouble() + ("°")))
                        Spacer()
                        WeatherRow(logo: "thermometer", name: "Max temp", value: (weather.main.tempMax.roundDouble() + "°"))
                    }
                    HStack {
                        WeatherRow(logo: "wind", name: "Wind speed", value: (weather.wind.speed.roundDouble() + " m/s"))
                        Spacer()
                        WeatherRow(logo: "humidity", name: "Humidity", value: "\(weather.main.humidity.roundDouble())%")
                    }
                }
                .frame(maxWidth:.infinity, alignment:.leading)
                .padding()
                .padding(.bottom,20)
                .foregroundColor(Color(hue:0.656, saturation:0.787, brightness:0.354))
                .background(.purple)
                .cornerRadius(20, corners:[.topLeft, .topRight])
            }
        }
        .edgesIgnoringSafeArea(.bottom)
        .background(Color(hue:0.9, saturation:0.6, brightness:0.3))
        .preferredColorScheme(.dark)
    }
}

struct WeatherView_Previews:PreviewProvider{
    static var previews: some View{
        WeatherView(weather:previewWeather)
    }
}
