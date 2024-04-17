//
//  SendMessageBar.swift
//  ChatApp
//
//  Created by Fareed Quraishi on 2024-04-03.
//

import SwiftUI

struct SendMessageBar: View {
    @Binding var newMessage: String
    var sendMessage: () -> Void
    
    var body: some View {
        HStack {
            Spacer(minLength: 15)
            TextField("Send a message", text: $newMessage, onCommit: { sendMessage() })
                .textFieldStyle(.roundedBorder)
            Button(action: sendMessage) {
                Image(systemName: "paperplane")
            }
            Spacer(minLength: 15)
        }
    }
}



//#Preview {
//    SendMessageBar(newMessage: $name, mySendMessage: doNothing)
//}
