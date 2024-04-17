//
//  Planet.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-04-17.
//

import Foundation

struct Planet: Codable, Identifiable {
    let id: Int
    let name: String
    let position:Position
    let dignity:String?
}

