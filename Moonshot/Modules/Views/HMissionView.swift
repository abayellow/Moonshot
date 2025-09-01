//
//  HMissionView.swift
//  Moonshot
//
//  Created by Alexander Abanshin on 19.07.25.
//

import SwiftUI

struct HMissionView: View {
    
    let crew: [CrewMember]

    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) { crewMember in
                    NavigationLink {
                        AstronautView(astronaut: crewMember.astronaut)
                    } label: {
                        HStack {
                            Image(crewMember.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay(
                                    Capsule()
                                        .strokeBorder(.white, lineWidth: 1)
                                )

                            VStack(alignment: .leading) {
                                Text(crewMember.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                Text(crewMember.role)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

//struct HMissionView_Previews: PreviewProvider {
//    static let missions: [Mission] = Bundle.main.decode("missions.json")
//    static let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
//
//    static var previews: some View {
//        HMissionView(
//            crew: [CrewMember(role: missions[0].crew[0].role],
//            astronaut: astronauts["aldrin"]!)
//        )
//    }
//}
