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
        let x = planet.position.angleOfXOnCircle(radius)
        let y = planet.position.angleOfYOnCircle(radius)
        let circleWidth: CGFloat = isSelected ? 14 : 8
        return Circle()
            .foregroundColor(isSelected ? .red : .black)
            .frame(width: circleWidth, height: circleWidth)
            .position(x: x, y: y)
    }
    
    func degreesToRadians(_ degrees: Int) -> CGFloat {
        return CGFloat(degrees) * .pi / 180
    }
}

//#Preview {
//    CirclePoint()
//}
