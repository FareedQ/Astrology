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
    
    @StateObject var vm = AstrologyViewModel()
    
    var body: some View {
        VStack {
            DateTimePicker(birthDate: $birthDate, vm: vm, planets: $planets, extractDateTime: extractDateTime)
            .padding(10)
            PlanetList(planets: planets)
        }
        .onAppear {
            Task {
                await vm.fetchData()
                planets = vm.planets
            }
        }
    }
    
    func extractDateTime(_ given:Date) -> (String, String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let date = dateFormatter.string(from: given)
        dateFormatter.dateFormat = "HH:mm:ss"
        let time = dateFormatter.string(from: given)
        return (date, time)
    }
}

struct AstrologyView_Previews: PreviewProvider {
    static var previews: some View {
        AstrologyView()
    }
}
