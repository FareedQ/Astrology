//
//  CircleView.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-04-18.
//

import SwiftUI

struct CircleView: View {
    var planets: [Planet]
    let radius: CGFloat
    let selectedPlanet: Planet?
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.gray, lineWidth: 1)
                .frame(width: radius * 2, height: radius * 2)
            ForEach(0..<12) { index in
                DividingLine(radius: radius, index: index)
            }
            ForEach(planets, id: \.self) { planet in
                CirclePoint(radius: radius, planet: planet, isSelected: planet == selectedPlanet)
            }
        }
    }
}


// CircleView offsets the dividing line
// please use the ChartView instead for preview
struct CircleView_Previews: PreviewProvider {
    static var previews: some View {
        let dummyPlanets: [Planet] = [
            Planet(id: 2, name: "Mercury", position: Position(absoluteDegrees: 205.86025556905815, sign: "Libra", deg: 25.860255569058154, min: 51.615334143489235, sec: 36.920048609354126), dignity: nil),
            Planet(id: 3, name: "Venus", position: Position(absoluteDegrees: 271.0063585996412, sign: "Capricorn", deg: 1.006358599641203, min: 0.38151597847218, sec: 22.8909587083308), dignity: nil),
            Planet(id: 4, name: "Mars", position: Position(absoluteDegrees: 159.41697938880412, sign: "Virgo", deg: 9.416979388804123, min: 25.01876332824736, sec: 1.1257996948415894), dignity: nil),
        ]
        
        let selectedPlanet: Planet? = dummyPlanets.first
        
        return CircleView(planets: dummyPlanets, radius: 100, selectedPlanet: selectedPlanet)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
