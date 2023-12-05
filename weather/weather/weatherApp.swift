//
//  weatherApp.swift
//  weather
//
//  Created by user243761 on 11/19/23.
//

//importing swift ui framework
import SwiftUI

//start executing code
@main
struct weatherApp: App {
    //body App protocal, returns Scene part of user interface
    var body: some Scene {
           WindowGroup { //groups together views in app, creates new window.
               StartingPage() // first screen user sees
            
           }
       }
}
