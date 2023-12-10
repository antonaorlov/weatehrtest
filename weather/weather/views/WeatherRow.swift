//
//  WeatherRow.swift
//  weather
//
//  Created by user243761 on 11/19/23.
//

import Foundation
import SwiftUI

struct WeatherRow: View{
    //string of weather data
    var logo:String
    var name:String
    var value:String
    
    var body: some View{
        //horizontal stack
        HStack(spacing:20){
            Image(systemName:logo)
                .font(.title2)
                .frame(width:20,height:20)
                .padding()
                .background(Color(hue:1.0, saturation:0.0, brightness:0.888))
                .cornerRadius(50)
            
            VStack(alignment: .leading, spacing:8){
                Text(name)
                    .font(.caption)
                
                Text(value)
                    .bold()
                    .font(.title)
            }
        }
    }
}

struct WeatherRow_Previews:PreviewProvider{
    static var previews: some View{
        WeatherRow(logo: "thermometer", name:"Feels like", value:"8*")
    }
}
