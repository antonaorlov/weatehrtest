//
//  WelcomeView.swift
//  weather
//
//  Created by user243761 on 11/19/23.
//

//framework that gets location-user interfaces
import CoreLocationUI
import SwiftUI

//new structure StartingPage called by main user interface
struct StartingPage: View {
    //environemnt object manage location data,
    //Location Manager custom class handling location functions
  @EnvironmentObject var locationManager: LocationManager
    //state variable controls opacity of button for animation
    @State private var buttonOpacity: Double = 0
    //body defines view content
  var body: some View {
      //naviagetion of app
    NavigationView {
        //vertical stack for children code
      VStack {
          //obtain image url, check if possible
                  AsyncImage(url: URL(string: "https://www.freeiconspng.com/thumbs/weather-icon-png/weather-icon-png-8.png")) { phase in
            if let image = phase.image {
            image
              .resizable()
              .scaledToFit()
          } else if phase.error != nil {
            Text("There was an error loading the image.")
            ProgressView()
          }
        }
        .frame(width: 200, height: 200)
          //vertical stack display Texts
        VStack(spacing: 20) {
          Text("BEST WEATHER APP")
            .bold()
            .font(.title)
            .foregroundColor(.orange)

          Text("Start Now and know the Weather is currrently in 2 Steps")
            .padding()
            .foregroundColor(.yellow)
        }
        .multilineTextAlignment(.center)
        .padding()
       
          //button navigates to view to LocationListView file
          NavigationLink(destination: LocationListView()) {
          Text("Go to Locations")
            .foregroundColor(.white)
            .padding()
            .background(Color.green)
            .cornerRadius(10)
        }
          .opacity(buttonOpacity)
          //animate button
                          .onAppear {
                              withAnimation(.easeIn(duration: 2.0)) {
                                  buttonOpacity = 1
                              }
                          }              }
      
      .cornerRadius(30)
      .symbolVariant(.fill)
      .foregroundColor(.purple)
    
    }
    .frame(maxWidth: .infinity, maxHeight: .infinity)
    .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom))
    .edgesIgnoringSafeArea(.all)
  }
}

//create new structure, PreviewProvider to preview SwiftUi in canva
struct StartingPage_Previews: PreviewProvider {
    //return Starting Page view file
  static var previews: some View {
    StartingPage()
  }
}
