// Created by deovinsum

import SwiftUI

struct ListView: View {
    let astronauts: [String: Astronaut]
    let missions: [Mission]

    var body: some View {
        ScrollView {
            LazyVStack {
                ForEach(missions) { mission in
                    NavigationLink(value: mission) {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    }
                    .navigationDestination(for: Mission.self) { mission in
                        MissionView(mission: mission, astronauts: astronauts)
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    
    return ListView(astronauts: astronauts, missions: missions)
        .preferredColorScheme(.dark)
}
