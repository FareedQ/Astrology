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
    
    var body: some View {
        VStack {
            DatePicker(selection: $birthDate, displayedComponents: [.hourAndMinute, .date]) {
                Text("Select a date & time")
            }.onChange(of: birthDate) { date, _ in
                Task {
                    let currDate = date.extractDateTimeAsStrings()
                    let parameters = [
                        "date":currDate.date,
                        "time":currDate.time
                    ]
                    await vm.fetchData(parameters)
                    planets = vm.planets
                }
            }
        }
    }
}

struct DateTimePicker_Preview: PreviewProvider {
    static var previews: some View {
        // Provide dummy data or mock objects for bindings and observed object
        let birthDate = Binding<Date>(
            get: { Date() },
            set: { _ in }
        )
        
        let vm = AstrologyViewModel()
        let planets: [Planet] = [] // Provide an empty array or mock data
        
        return DateTimePicker(birthDate: birthDate, vm: vm, planets: .constant(planets))
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
