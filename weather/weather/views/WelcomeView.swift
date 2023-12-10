
//  WelcomeView.swift
//  weather
//
//  Created by user243761 on 11/19/23.
//

//import swiftui, CorelocationUI
import SwiftUI
import CoreLocationUI


//welcomeview struct
struct WelcomeView: View{
    //locationManager hadnling location services
    @EnvironmentObject var locationManager:LocationManager
    
    var body: some View{
        VStack{
            AsyncImage(url: URL(string: "https://freepngimg.com/thumb/categories/2275.png")) { phase in
                if let image = phase.image{
                    image
                        .resizable()
                        .scaledToFit()
                }
                else if phase.error != nil{
                    Text("Error loading image")
                }
                else{
                    ProgressView()//show progress view while loading
                }
            }
            .frame(width:200,height:200)
            VStack(spacing:20){
                Text("Welcome to Weather App")
                    .bold()
                    .font(.title)
                Text("Please Share your current location to get the weather in your area")
                    .padding()
            }
            .multilineTextAlignment(.center)
            .padding()
            //CreLocationUI Framework, requestinf location permission
            //sharing update user current location
            LocationButton(.shareCurrentLocation){
                locationManager.requestLocation()
            }
            .cornerRadius(30)
            .symbolVariant(.fill)
            .foregroundColor(.white)
        }
        .frame(maxWidth:.infinity, maxHeight:.infinity)
        .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom))
        .edgesIgnoringSafeArea(.all)    }
}

struct WelcomeView_Previews: PreviewProvider{
    static var previews: some View {
        WelcomeView()
    }
}
