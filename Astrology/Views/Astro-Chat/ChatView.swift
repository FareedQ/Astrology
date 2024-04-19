//
//  ContentView.swift
//  ChatApp
//
//  Created by Fareed Quraishi on 2024-04-03.
//

import SwiftUI

struct ChatView: View {
    @State var message: String = ""
    
    @StateObject var vm = ChatViewModel()
    
    var body: some View {
        ScrollViewReader { proxy in
            VStack {
                MessageList(proxy: proxy)
                    .environmentObject(vm)
                Divider()
                Spacer(minLength: 10)
                SendMessageBar(message: $message)
                    .environmentObject(vm)
                Spacer(minLength: 10)
            }
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView()
    }
}
