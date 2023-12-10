//FavoriteLocationView
//
//  FavoriteLocationView.swift
//  weather
//
//  Created by user243761 on 11/19/23.
import SwiftUI

struct FavoriteLocationsView: View{
    var locations:[Location]
    
    var body: some View{
        ZStack{
            //Gradient background
            LinearGradient(gradient:Gradient(colors:[Color.blue, Color.purple]), startPoint:.topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all) //gradient fills whole background
            
            //Lists
            List{
                ForEach(locations, id:\.id){ location in
                    Text(location.name)
                }
            }
            .navigationTitle("Favorite locations")
        }
    }
}
