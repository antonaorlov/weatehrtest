//
//  StartingPage.swift
//  weather
//
//  Created by user243761 on 11/19/23.
//

//framework gets location user interfaces
import CoreLocationUI
import SwiftUI

//new structure StartingPage called by main user interface
struct StartingPage: View{
    //environment object manages location data,
    //LocationManager custom class handling location functions
    @EnvironmentObject var locationManager: LocationManager
    //state variable controls opcaity of button for animation
    @State private var buttonOpacity: Double=0
    
    //body defines view content
    var body: some View{
        //navigation of app
        NavigationView{
            //vertical stack of children code
            VStack{
                //obtain image url
                AsyncImage(url:URL(string:"https://www.freeiconspng.com/thumbs/weather-icon-png/weather-icon-png-8.png")) { phase in
                    if let image = phase.image{
                        image
                            .resizable()
                            .scaledToFit()
                    }
                    else if phase.error != nil{
                        Text("There was error loading the image")
                        ProgressView()
                    }
                }
                .frame(width:200, height:200)
                //vertical stack displays Texts
                VStack(spacing:20){
                    Text("BEST WEATHER APP EVER")
                        .bold()
                        .font(.title)
                        .foregroundColor(.orange)
                    
                    Text("Start Now and Know the Weather is in 2 Steps")
                        .padding()
                        .foregroundColor(.yellow)
                }
                .multilineTextAlignment(.center)
                .padding()
                
                //button navigates to view to LocationListView file
                NavigationLink(destination: LocationListView()){
                    Text("Go to Locations")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.green)
                        .cornerRadius(10)
                }
                .opacity(buttonOpacity)
                //animate button
                .onAppear{
                    withAnimation(.easeIn(duration:2.0)){
                        buttonOpacity=1
                    }
                }
            }
            .cornerRadius(30)
        }
        .frame(maxWidth:.infinity, maxHeight:.infinity)
    }
}

//create new structure, PreviewProvider to preview SwiftUI in Canva
struct StartingPage_Previews: PreviewProvider{
    //return StartingPage
    static var previews: some View{
        StartingPage()
    }
}
