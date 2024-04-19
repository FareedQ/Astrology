//
//  DateExtension.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-04-19.
//

import Foundation

extension Date {
    func extractDateTimeAsStrings() -> (date: String, time: String) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "YYYY-MM-dd"
        let date = dateFormatter.string(from: self)
        dateFormatter.dateFormat = "HH:mm:ss"
        let time = dateFormatter.string(from: self)
        return (date: date, time: time)
    }
}
