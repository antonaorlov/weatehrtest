import SwiftUI

struct FavoriteLocationsView: View {
    var locations: [Location]

    var body: some View {
        ZStack {
            // Gradient background
            LinearGradient(gradient: Gradient(colors: [Color.blue, Color.purple]), startPoint: .topLeading, endPoint: .bottomTrailing)
                .edgesIgnoringSafeArea(.all) // This will make sure the gradient fills the whole background

            // List
            List {
                ForEach(locations, id: \.id) { location in
                    Text(location.name)
                }
            }
            .navigationTitle("Favorite Locations")
        }
    }
}

