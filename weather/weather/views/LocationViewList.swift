
import SwiftUI

struct Location: Identifiable {
    let id = UUID() // Unique identifier for each location
    var name: String
    var isFavorite: Bool
}

struct LocationListView: View {
    
    @State private var locations: [Location] = [
            Location(name: "Brooklyn", isFavorite: false),
            Location(name: "New York City", isFavorite: false),
            Location(name: "New Jersey", isFavorite: false),
            Location(name: "Philadelphia, NY", isFavorite: false),
            Location(name: "Rochester, NY", isFavorite: false)
        ]
    
    
    @State private var showingAddLocationSheet = false
    @State private var newLocation = ""
    @State private var editMode = EditMode.inactive
    
       var body: some View {
           NavigationView {
               VStack {
                
Text("Step 2) See which locations are next to you")
                       .bold()
                       .font(.title2)
                       .foregroundColor(Color.white)
                       .padding()
                    .background(Color.blue)
                       .cornerRadius(10)
                       .padding(.vertical, 8)
                       .padding(.bottom, 100)
                       .padding(.top,10)

                   List {
                       ForEach($locations) { $location in
                           HStack {
                               NavigationLink(destination: ContentView()) {
                                   Text(location.name)
                               }
                               Spacer()
                               Image(systemName: location.isFavorite ? "star.fill" : "star")
                                   .foregroundColor(.yellow)
                                   .onTapGesture {
                                       location.isFavorite.toggle()
                                   }
                           }
                       }
                       .onDelete(perform: deleteLocation)
                       .onMove(perform: moveLocation)
                   }
                   .listStyle(PlainListStyle())

                   Button("Add New Location") {
            self.showingAddLocationSheet = true
                   }
                   .padding()
                   .background(Color.purple)
                   .foregroundColor(Color.white)
                   .cornerRadius(12)
                   .frame(maxWidth: .infinity)

                   NavigationLink(destination: FavoriteLocationsView(locations: locations.filter { $0.isFavorite })) {
                       Text("See Favorites")
                           .frame(minWidth: 0, maxWidth: .infinity)
                           .padding()
                           .background(Color.yellow)
                           .foregroundColor(Color.white)
                           .cornerRadius(10)
                   }
                   .padding(.horizontal)
                   .padding(.bottom, 50)
               }
               .navigationBarTitle("Locations", displayMode: .inline)
               .navigationBarItems(trailing: EditButton())
               
               .background(LinearGradient(gradient: Gradient(colors: [Color.pink, Color.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
           }
           .sheet(isPresented: $showingAddLocationSheet) {
                       // Ensure that the view you're presenting here is correct.
                       // For example, if you're presenting a form to add a new location, it could be like this:
                       VStack(spacing: 20) {
                           Text("Add a new location")
                               .font(.headline)

                           TextField("Location name", text: $newLocation)
                               .textFieldStyle(RoundedBorderTextFieldStyle())
                               .padding()

                           Button("Save") {
                               // Logic to save the new location.
                               if !newLocation.isEmpty {
                                   let newLocationEntry = Location(name: newLocation, isFavorite: false)
                                   locations.append(newLocationEntry) // Append the new location to the list.
                                   newLocation = "" // Clear the TextField.
                               }
                               showingAddLocationSheet = false // Dismiss the sheet.
                           }
            .padding()
                           // ... rest of your button styling ...
                       }
                       .padding()
                   }
       }
       
       func deleteLocation(at offsets: IndexSet) {
           locations.remove(atOffsets: offsets)
       }
       
       func moveLocation(from source: IndexSet, to destination: Int) {
           locations.move(fromOffsets: source, toOffset: destination)
       }
   }

   struct LocationListView_Previews: PreviewProvider {
       static var previews: some View {
           LocationListView()
       }
   }
