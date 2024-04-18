//
//  PlanetList.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-04-17.
//

import SwiftUI

struct PlanetList: View {
    @Binding var selectedPlanet: Planet?
    let planets: [Planet]
    
    var body: some View {
        List(planets, id: \.self, selection: $selectedPlanet) { planet in
            PlanetCell(planet: planet)
        }
    }
}
