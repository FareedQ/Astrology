//
//  MessageView.swift
//  ChatApp
//
//  Created by Fareed Quraishi on 2024-04-03.
//

import SwiftUI

struct MessageView : View {
    var currentMessage: Message
    
    var body: some View {
        HStack(alignment: .bottom, spacing: 10) {
            if currentMessage.isCurrentUser {
                Spacer()
                MessageCell(contentMessage: currentMessage.content,
                            isCurrentUser: currentMessage.isCurrentUser)
            } else {
                MessageCell(contentMessage: currentMessage.content,
                            isCurrentUser: currentMessage.isCurrentUser)
                Spacer()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


#Preview {
    MessageView(currentMessage: Message(content: "This is a single message cell with avatar. If user is current user, we won't display the avatar.", isCurrentUser: false))
}
