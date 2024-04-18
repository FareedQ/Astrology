//
//  ChartView.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-04-18.
//

import SwiftUI

struct ChartView: View {
    let planets: [Planet]
    let radius: CGFloat = 100
    @Binding var selectedPlanet: Planet?
    
    var body: some View {
        VStack {
            CircleView(planets: planets, radius: radius, selectedPlanet: selectedPlanet)
                .frame(width: radius * 2, height: radius * 2)
        }
    }
}
