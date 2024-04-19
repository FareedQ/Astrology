//
//  CirclePoint.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-04-18.
//

import SwiftUI

struct CirclePoint: View {
    let radius: CGFloat
    let planet: Planet
    let isSelected: Bool
    
    var body: some View {
        let position = planet.position.onCircleWithRadius(radius)
        let circleWidth: CGFloat = isSelected ? 10 : 8
        
        return Circle()
            .foregroundColor(isSelected ? .red : .black)
            .frame(width: circleWidth, height: circleWidth)
            .offset(x: position.x, y: position.y)
    }
}

struct CirclePoint_Preview: PreviewProvider {
    static var previews: some View {
        let radius: CGFloat = 100
        let planet = Planet(id: 3, name: "Venus", position: Position(absoluteDegrees: 271.0063585996412, sign: "Capricorn", deg: 1.006358599641203, min: 0.38151597847218, sec: 22.8909587083308), dignity: nil)
        
        return CirclePoint(radius: radius, planet: planet, isSelected: false)
            .frame(width: radius * 2, height: radius * 2)
            .padding()
            .background(Color.white) // Add a background to see the point clearly
    }
}
