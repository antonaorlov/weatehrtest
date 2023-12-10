//
//  ContentView.swift
//  weather
//
//  Created by user243761 on 11/19/23.

//import swift framework
import SwiftUI

//new structure ContentView
struct ContentView: View{
    //location manager as stateobject
    @StateObject var locationManager = LocationManager()
    //WeatherManager managing weather data, dosent change the state
    var weatherManager=WeatherManager()
    //holds option responsebody, if changes updates App
    @State var weather: ResponseBody?
    //control animation
    @State private var animate = false
    //toggle animation
    @State private var showAnimation=false
    
    //view content
    var body:some View{
        //vertical stacks
        VStack{
            //display location, weather data
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather:weather)
                }
                //if location shows but weather data did not, LoadingView starts
                else{
                    LoadingView()
                    //fetch weather data based on current location, latitude longitude
                        .task{
                            do{
                                weather=try await weatherManager.getCurrentWeather(latitude:location.latitude,longitude:location.longitude)
                            }
                            catch{
                                print("Not getting weather error: \(error)")
                            }
                        }
                }
            }
            //if location not available, check LocationManager is loading, if it does
            //run LoadingView, else pass WelcomeView Location Manager as environment object
            else{
                if locationManager.isLoading{
                    LoadingView()
                }
                else{
                    WelcomeView()
                        .environmentObject(locationManager)
                    
                }
            }
        }
        .background(Color(hue:0.656, saturation:0.787, brightness:0.354))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider{
    static var previews: some View{
        ContentView()
    }
}
