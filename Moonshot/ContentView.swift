// Created by deovinsum

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = true

    var body: some View {
        NavigationStack {
                Group {
                    if showingGrid {
                        GridView(astronauts: astronauts, missions: missions)
                    } else {
                        ListView(astronauts: astronauts, missions: missions)
                    }
                }
                .toolbar{
                    ToolbarItem() {
                        Button("Switch Layout") {
                            showingGrid.toggle()
                        }
                    }
                }
                .padding([.horizontal, .bottom])

            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
        }
    }
}

#Preview {
    ContentView()
}
