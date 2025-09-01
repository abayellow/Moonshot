//
//  AstronautView.swift
//  Moonshot
//
//  Created by Alexander Abanshin on 19.07.25.
//

import SwiftUI

struct AstronautView: View {
    let astronaut: Astronaut
    
    var body: some View {
        ScrollView {
            VStack {
                Image(astronaut.id)
                    .resizable()
                    .scaledToFit()
                
                Text(astronaut.description)
                    .padding()
            }
            .accessibilityElement()
            .accessibilityLabel("\(astronaut.name). \(astronaut.description)")
        }
        .background(.darkBackground)
        .navigationTitle(astronaut.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AstronautView_Previews: PreviewProvider {
    static let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    static var previews: some View {
        AstronautView(astronaut: astronaut["aldrin"]!)
            .preferredColorScheme(.dark)
    }
}
