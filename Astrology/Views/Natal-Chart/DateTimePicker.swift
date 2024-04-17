//
//  DateTimePicker.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-04-17.
//

import SwiftUI

struct DateTimePicker: View {
    @Binding var birthDate: Date
    @ObservedObject var vm: AstrologyViewModel
    @Binding var planets: [Planet]
    var extractDateTime: (Date) -> (String, String)
    
    var body: some View {
        VStack {
            DatePicker(selection: $birthDate, displayedComponents: [.hourAndMinute, .date]) {
                Text("Select a date & time")
            }.onChange(of: birthDate) { date, _ in
                Task {
                    let currDate = extractDateTime(date)
                    let parameters = [
                        "date":currDate.0,
                        "time":currDate.1
                    ]
                    await vm.fetchData(parameters)
                    planets = vm.planets
                }
            }
        }
    }
}

//#Preview {
//    DateTimePicker()
//}
