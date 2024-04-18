//
//  Planet.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-04-17.
//

import Foundation

struct Planet: Codable, Identifiable, Hashable {
    static func == (lhs: Planet, rhs: Planet) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let name: String
    let position: Position
    let dignity: String?
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(name)
        hasher.combine(position)
        hasher.combine(dignity)
    }
}
