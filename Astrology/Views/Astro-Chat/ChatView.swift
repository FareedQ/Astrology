//
//  ContentView.swift
//  ChatApp
//
//  Created by Fareed Quraishi on 2024-04-03.
//

import SwiftUI

struct ChatView: View {
    @State var messages: [Message] = []
    @State var newMessage: String = ""
    
    @StateObject var vm = ChatViewModel()
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                MessageList(proxy: proxy, messages: $messages)
                Divider()
                Spacer(minLength: 10)
                SendMessageBar(newMessage: $newMessage, sendMessage: sendMessage)
                Spacer(minLength: 10)
            }
        }
    }
    
    
    func sendMessage() -> Void {
        if !newMessage.isEmpty {
            Task {
                messages.append(Message(content: newMessage, isCurrentUser: true))
                await vm.fetchData(["question":newMessage])
                messages.append(Message(content: vm.responseData.response, isCurrentUser: false))
                newMessage = ""
            }
        }
    }
}

#Preview {
    ChatView()
}
