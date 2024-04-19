//
//  PostViewModel.swift
//  ChatApp
//
//  Created by Fareed Quraishi on 2024-04-09.
//

import Foundation

@MainActor class ChatViewModel: ObservableObject {
    @Published var responseData = Post(response: "")
    var messages: [Message] = []
    
    let url = "https://fareedq.pythonanywhere.com/v1/astro-chat/"
    func fetchData(_ parameters: [String:String] = [:]) async {
        guard let downloadedData: Post = await WebService().downloadData(fromURL: url, parameters: parameters) else {return}
        responseData = downloadedData
    }
    
    func sendMessage(_ message: String) -> Void {
        if !message.isEmpty {
            Task {
                messages.append(Message(content: message, isCurrentUser: true))
                await fetchData(["question":message])
                messages.append(Message(content: responseData.response, isCurrentUser: false))
            }
        }
    }
}
