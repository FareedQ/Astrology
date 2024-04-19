//
//  SendMessageBar.swift
//  ChatApp
//
//  Created by Fareed Quraishi on 2024-04-03.
//

import SwiftUI

struct SendMessageBar: View {
    @Binding var message: String
    @EnvironmentObject private var vm: ChatViewModel
    
    var body: some View {
        HStack {
            Spacer(minLength: 15)
            TextField("Send a message", text: $message, onCommit: {
                vm.sendMessage(message)
                message = ""
            })
                .textFieldStyle(.roundedBorder)
            Button(action: {
                vm.sendMessage(message)
                message = ""
            }) {
                Image(systemName: "paperplane")
            }
            Spacer(minLength: 15)
        }
    }
}

struct SendMessageBar_Previews: PreviewProvider {
    static var previews: some View {
        let dummyMessage = "Hello, World!"
        let chatViewModel = ChatViewModel()
        let messageBinding = Binding<String>(
            get: { dummyMessage },
            set: { _ in }
        )
        
        return SendMessageBar(message: messageBinding)
            .environmentObject(chatViewModel)
            .previewLayout(.fixed(width: 400, height: 50)) // Adjust the preview size as needed
            .padding()
            .background(Color.white) // Add a background color for better visibility
    }
}
