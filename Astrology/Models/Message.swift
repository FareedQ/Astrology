//
//  Message.swift
//  ChatApp
//
//  Created by Fareed Quraishi on 2024-04-03.
//

import Foundation

struct Message: Hashable {
    var id = UUID()
    var content: String
    var isCurrentUser: Bool
}
