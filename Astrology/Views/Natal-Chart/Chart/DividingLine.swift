//
//  DividingLine.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-04-19.
//

import SwiftUI

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
        .stroke(style: StrokeStyle(lineWidth: 0.5, dash: [10]))
        .foregroundColor(.gray)
    }
}

struct DividingLine_Previews: PreviewProvider {
    static var previews: some View {
        let radius: CGFloat = 100
        let numberOfLines = 12
        
        return ZStack {
            ForEach(0..<12) { index in
                let angle = CGFloat(index) * (2 * .pi / CGFloat(numberOfLines))
                let start = CGPoint(x: radius * cos(angle - (.pi / 2)) + radius, y: radius * sin(angle - (.pi / 2)) + radius)
                let end = CGPoint(x: radius * cos(angle + (.pi / 2)) + radius, y: radius * sin(angle + (.pi / 2)) + radius)
                
                Path { path in
                    path.move(to: start)
                    path.addLine(to: end)
                }
                .stroke(style: StrokeStyle(lineWidth: 0.5, dash: [10]))
                .foregroundColor(.gray)
            }
        }
        .frame(width: radius * 2, height: radius * 2)
        .padding()
        .background(Color.white) // Add a background to see lines clearly
    }
}
