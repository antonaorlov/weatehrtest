//
//  LoadingView.swift
//  weather
//
//  Created by user243761 on 11/19/23.
//

//import SwiftUI framework
import SwiftUI

//struct LoadingView file
struct LoadingView: View{
    var body: some View{
        //creates ProgressView(), speening wheel
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth:.infinity,maxHeight:.infinity)
    }
}

//load loading view file
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View{
        LoadingView()
    }
}

