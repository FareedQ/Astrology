//
//  MessageCell.swift
//  ChatApp
//
//  Created by Fareed Quraishi on 2024-04-03.
//

import SwiftUI

struct MessageCell: View {
    var contentMessage: String
    var isCurrentUser: Bool
    
    var body: some View {
        Text(contentMessage)
            .padding(10)
            .foregroundColor(isCurrentUser ? Color.white : Color.black)
            .background(isCurrentUser ? Color.blue : Color(UIColor.systemGray6 ))
            .cornerRadius(10)
    }
}

#Preview {
    MessageCell(contentMessage: "This is a single message cell.", isCurrentUser: false)
}
