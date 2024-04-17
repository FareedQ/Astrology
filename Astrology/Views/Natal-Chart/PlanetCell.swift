//
//  PlanetCell.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-04-17.
//

import SwiftUI

struct PlanetCell: View {
    var planet: Planet
    
    var body: some View {
        HStack {
            Text(planet.name)
            Spacer()
            Text(planet.position.asText())
        }
    }
}

//#Preview {
//    PlanetCell()
//}
