//
//  ContentView.swift
//  weather
//
//  Created by user243761 on 11/19/23.
//

//import swift framework
import SwiftUI

//new strcuture ContetnView
struct ContentView: View {
    //Location manager as StateObject
    @StateObject var locationManager = LocationManager()
    //WeatherManager managing weather data, dosent change state
    var weatherManager = WeatherManager()
    //Holds optional ResponseBody, if changes updates app
    @State var weather: ResponseBody?
    //control animation
    @State private var animate = false
    //toggle animation
    @State private var showAnimation = false
    
    //view content
    var body: some View {
        //vertical stack
        VStack {
            
            //AnimatedView(isVisible: $showAnimation)
            //if displays location and weather data
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } 
                //if location showed but weather data not, LoadingView() operates
                else {
                    LoadingView()
                    //fetch weather data based on current location, latitude, longitude
                        .task {
                            do {
                                weather = try await weatherManager.getCurrentWeather(latitude: location.latitude, longitude: location.longitude)
                            } catch {
                                print("Error getting weather: \(error)")
                            }
                        }
                }
            } 
            //if location not available check LocationManager is loading, if it does
            //run LoadingView, otherwise pass WelcomeView LocationManager as environment object
            else{
                if locationManager.isLoading {
                    LoadingView()
                } else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

