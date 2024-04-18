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
                .stroke(Color.blue, lineWidth: 2)
                .frame(width: radius * 2, height: radius * 2)
            ForEach(0..<12) { index in
                DividingLine(radius: radius, index: index)
            }
            ForEach(planets, id: \.self) { planet in
                CirclePoint(radius: radius, planet: planet, isSelected: planet == selectedPlanet)
                    .overlay(
                        Circle()
                            .foregroundColor(.clear)
                            .frame(width: 20, height: 20)
                            .position(x: planet.position.angleOfXOnCircle(radius), y: planet.position.angleOfYOnCircle(radius))
                    )
            }
        }
    }
}

struct DividingLine: View {
    let radius: CGFloat
    let index: Int
    
    var body: some View {
        let angle: CGFloat = CGFloat(index) * (2 * .pi / 12)
        let start = CGPoint(x: radius * cos(angle - (.pi / 2)) + radius, y: radius * sin(angle - (.pi / 2)) + radius)
        let end = CGPoint(x: radius * cos(angle + (.pi / 2)) + radius, y: radius * sin(angle + (.pi / 2)) + radius)
        
        return Path { path in
            path.move(to: start)
            path.addLine(to: end)
        }
        .stroke(style: StrokeStyle(lineWidth: 1, dash: [10]))
        .foregroundColor(.gray)
    }
}

//#Preview {
//    CircleView()
//}
