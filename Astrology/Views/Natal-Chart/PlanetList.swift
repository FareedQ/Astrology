//
//  PlanetList.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-04-17.
//

import SwiftUI

struct PlanetList: View {
    var planets: [Planet]
    
    var body: some View {
        List(planets, id: \.id) { planet in
            PlanetCell(planet: planet)
        }
    }
}

#Preview {
    PlanetList(planets: [Planet]())
}
