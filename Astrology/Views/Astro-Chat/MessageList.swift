//
//  MessageList.swift
//  ChatApp
//
//  Created by Fareed Quraishi on 2024-04-03.
//

import SwiftUI

struct MessageList: View {
    var proxy: ScrollViewProxy
    @Binding var messages: [Message]
    
    var body: some View {
        List(0 ..< messages.count, id: \.self) { i in
            MessageView(currentMessage: messages[i])
                .listRowSeparator(.hidden)
        }
        .listStyle(PlainListStyle())
        .onChange(of: messages.count) { _, _ in
            withAnimation(.easeInOut(duration: 60)) {
                proxy.scrollTo(messages.count - 1)
            }
        }
    }
}

//#Preview {
//    MessageList()
//}
