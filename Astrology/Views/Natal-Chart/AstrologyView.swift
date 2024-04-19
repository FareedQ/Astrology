//
//  ContentView.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-01-10.
//

import SwiftUI

struct AstrologyView: View {
    @State var planets = [Planet]()
    @State private var username: String = ""
    @State private var birthDate = Date.now
    @State private var selectedPlanet: Planet? = nil
    
    @StateObject var vm = AstrologyViewModel()
    
    var body: some View {
        VStack {
            DateTimePicker(birthDate: $birthDate, vm: vm, planets: $planets)
            .padding(10)
            ChartView(planets: planets, selectedPlanet: $selectedPlanet)
            .padding(10)
            PlanetList(selectedPlanet: $selectedPlanet, planets: planets)
        }
        .onAppear {
            Task {
                await vm.fetchData()
                planets = vm.planets
            }
        }
    }
}

struct AstrologyView_Previews: PreviewProvider {
    static var previews: some View {
        AstrologyView()
    }
}
