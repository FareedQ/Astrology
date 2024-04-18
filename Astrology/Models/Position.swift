//
//  Position.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-04-17.
//

import Foundation

struct Position: Codable, Hashable {
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
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(absoluteDegrees)
        hasher.combine(sign)
        hasher.combine(deg)
        hasher.combine(min)
        hasher.combine(sec)
    }
    
    func angleOfXOnCircle(_ radius: CGFloat) -> CGFloat {
        return radius * cos(degreesToRadians(Int(absoluteDegrees))) + radius
    }
    
    func angleOfYOnCircle(_ radius: CGFloat) -> CGFloat {
        return radius * sin(degreesToRadians(Int(absoluteDegrees))) + radius
    }
    
    private func degreesToRadians(_ degrees: Int) -> CGFloat {
        return CGFloat(degrees) * .pi / 180
    }
}
