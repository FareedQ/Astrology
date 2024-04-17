//
//  Position.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-04-17.
//

import Foundation

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
