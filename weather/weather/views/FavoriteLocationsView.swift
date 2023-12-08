//
//  FavoriteLocationsView.swift
//  weather
//
//  Created by user243761 on 12/8/23.
//

import SwiftUI

struct FavoriteLocationsView: View {
    var locations: [Location]

    var body: some View {
        List {
            ForEach(locations, id: \.id) { location in
                Text(location.name)
            }
        }
        .navigationTitle("Favorite Locations")
    }
}
