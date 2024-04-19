//
//  MessageList.swift
//  ChatApp
//
//  Created by Fareed Quraishi on 2024-04-03.
//

import SwiftUI

struct MessageList: View {
    var proxy: ScrollViewProxy?
    @EnvironmentObject var vm: ChatViewModel
    
    var body: some View {
        List(0 ..< vm.messages.count, id: \.self) { i in
            MessageView(currentMessage: vm.messages[i])
                .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
        .onChange(of: vm.messages.count) { _, _ in
            withAnimation(.easeInOut(duration: 60)) {
                proxy?.scrollTo(vm.messages.count - 1)
            }
        }
    }
}

struct MessageList_Previews: PreviewProvider {
    static var previews: some View {
        let dummyMessages: [Message] = [
            Message(id: UUID(), content: "Hello!", isCurrentUser: true),
            Message(id: UUID(), content: "Hi there!", isCurrentUser: false),
            Message(id: UUID(), content: "How are you?", isCurrentUser: true),
            Message(id: UUID(), content: "I'm fine, thank you!", isCurrentUser: false),
            Message(id: UUID(), content: "What about you?", isCurrentUser: false),
            Message(id: UUID(), content: "I'm doing well too!", isCurrentUser: true),
        ]
        
        let chatViewModel = ChatViewModel()
        chatViewModel.messages = dummyMessages
        
        return MessageList()
            .environmentObject(chatViewModel)
    }
}
