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

struct PlanetCell_Previews: PreviewProvider {
    static var previews: some View {
        let dummyPlanet = Planet(id: 2, name: "Mercury", position: Position(absoluteDegrees: 205.86025556905815, sign: "Libra", deg: 25.860255569058154, min: 51.615334143489235, sec: 36.920048609354126), dignity: nil)
        
        return PlanetCell(planet: dummyPlanet)
            .previewLayout(.fixed(width: 300, height: 50))
            .padding()
            .background(Color.white) // Add a background to see the cell clearly
    }
}
