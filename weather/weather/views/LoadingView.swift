//
//  LoadingView.swift
//  weather
//
//  Created by user243761 on 11/19/23.
//

//import swiftui framework
import SwiftUI

//structu LoadingView file
struct LoadingView: View {
    var body: some View {
        //Creates ProgressView(), speening wheel default, maybe change it
        ProgressView()
            .progressViewStyle(CircularProgressViewStyle(tint: .white))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

//Load Loading View file
struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
