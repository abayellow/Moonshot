//
//  ContentView.swift
//  Moonshot
//
//  Created by Alexander Abanshin on 18.07.25.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State private var showingGrid = true
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    GridLayout(astronauts: astronauts, missions: missions)
                } else {
                    ListLayout(astronauts: astronauts, missions: missions)
                }
            }
            .navigationTitle("Moonshot")
            .background(.darkBackground)
            .toolbar {
                ToolbarItem {
                    Button {
                        showingGrid.toggle()
                    } label: {
                        Image(systemName: showingGrid ? "list.bullet" : "square.grid.2x2")
                            .foregroundStyle(.white)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
