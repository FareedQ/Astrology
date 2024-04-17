//
//  ContentView.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-01-10.
//

import SwiftUI

struct ContentView: View {
    @State var planets = [Planet]()
    @State private var username: String = ""
    @State private var birthDate = Date.now
    
    @StateObject var vm = PostViewModel()
    
    var body: some View {
        VStack {
            VStack {
                DatePicker(selection: $birthDate, displayedComponents: [.hourAndMinute, .date]) {
                    Text("Select a date & time")
                }.onChange(of: birthDate, perform: { date in
                    Task {
                        let currDate = extractDateTime(date)
                        let parameters = [
                            "date":currDate.0,
                            "time":currDate.1
                        ]
                        await vm.fetchData(parameters)
                        planets = vm.postData
                    }
                })
            }
            .padding(10)
            List(planets, id: \.id) { planet in
                HStack {
                    Text(planet.name)
                    Spacer()
                    Text(planet.position.asText())
                }
            }
            HStack {
                Spacer()
                Button("Save", action: {
                    let encoder = JSONEncoder()
                    if let encoded = try? encoder.encode(planets) {
                        let defaults = UserDefaults.standard
                        defaults.set(encoded, forKey: "userPlanets")
                    }
                })
                Spacer()
                Button("Load", action: {
                    if let savedPerson = UserDefaults.standard.object(forKey: "userPlanets") as? Data {
                        let decoder = JSONDecoder()
                        if let loadedPlanets = try? decoder.decode([Planet].self, from: savedPerson) {
                            planets = loadedPlanets
                        }
                    }
                })
                Spacer()
            }
        }
        .onAppear {
            Task {
                let parameters = [
                    "date":"1981-11-06",
                    "time":"12:00:00"
                ]
                await vm.fetchData(parameters)
                planets = vm.postData
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

struct Planet: Codable, Identifiable {
    let id: Int
    let name: String
    let position:Position
    let dignity:String?
}

struct Position: Codable {
    let absoluteDegrees: Float
    let sign: String
    let deg: Float
    let min: Float
    let sec: Float
    
    enum CodingKeys: String, CodingKey {
       case absoluteDegrees = "absolute_degrees"
       case sign
       case deg
       case min
       case sec
   }
    
    func asText() -> String {
        return "\(sign) \(Int(deg))° \(Int(min))'"
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
