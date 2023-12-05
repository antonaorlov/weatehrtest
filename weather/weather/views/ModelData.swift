//
//  ModelData.swift
//  weather
//
//  Created by user243761 on 11/19/23.
//

//

import Foundation


//global variable containing data of json file
var previewWeather: ResponseBody = load("WeatherData.json")

//decode json file to Swift tyoe. take filname returns instance type T
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    //finds the url of specified file, if not found error
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
        else {
            fatalError("Couldn't find \(filename) in main bundle.")
    }

    //tries to read data
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    //decode JSON DATA of Type T
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}


