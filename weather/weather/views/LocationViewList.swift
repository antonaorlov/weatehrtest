import SwiftUI

//new structure LocationListView
struct LocationListView: View {
    //aray of possible locations
    let locations = ["Brooklyn", "New York City", "New Jersey", "Philadelphia, NY", "Rochester, NY"]
    //views content
    var body: some View {
        //vertical stack layout spacing 200
            VStack(spacing: 200) {
                Spacer()
                //display text
                Text("Step 2) See which locations are next to you")
                    .bold()
                    .font(.title2)
                    .foregroundColor(Color.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .cornerRadius(10)
                    .padding(.top, 20)
                //displays list of locations. If clicked on location
                //will naviaget to ContetnView and will display that location
                List(locations, id: \.self) { location in
                               NavigationLink(destination: ContentView()) {
                                   Text(location)
                                       .foregroundColor(Color.blue)
                               }
                           }
                .listStyle(PlainListStyle())
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(LinearGradient(gradient: Gradient(colors: [Color.purple, Color.blue]), startPoint: .top, endPoint: .bottom))
            .edgesIgnoringSafeArea(.all)
        }
    }

//output LocationListView()
struct LocationListView_Previews: PreviewProvider {
    static var previews: some View {
        LocationListView()
    }
}
