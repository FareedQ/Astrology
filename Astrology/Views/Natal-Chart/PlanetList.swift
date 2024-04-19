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

struct PlanetList_Previews: PreviewProvider {
    static var previews: some View {
        let dummyPlanets: [Planet] = [
            Planet(id: 2, name: "Mercury", position: Position(absoluteDegrees: 205.86025556905815, sign: "Libra", deg: 25.860255569058154, min: 51.615334143489235, sec: 36.920048609354126), dignity: nil),
            Planet(id: 3, name: "Venus", position: Position(absoluteDegrees: 271.0063585996412, sign: "Capricorn", deg: 1.006358599641203, min: 0.38151597847218, sec: 22.8909587083308), dignity: nil),
            Planet(id: 4, name: "Mars", position: Position(absoluteDegrees: 159.41697938880412, sign: "Virgo", deg: 9.416979388804123, min: 25.01876332824736, sec: 1.1257996948415894), dignity: nil),
        ]
        
        let selectedPlanet: Planet? = dummyPlanets.first
        
        return PlanetList(selectedPlanet: .constant(selectedPlanet), planets: dummyPlanets)
            .padding()
            .background(Color.white) // Add a background to see the list clearly
    }
}
