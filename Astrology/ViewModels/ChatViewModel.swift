//
//  PostViewModel.swift
//  ChatApp
//
//  Created by Fareed Quraishi on 2024-04-09.
//

import Foundation

@MainActor class ChatViewModel: ObservableObject {
    @Published var responseData = Post(response: "")
    
    let url = "https://fareedq.pythonanywhere.com/v1/astro-chat/"
    func fetchData(_ parameters: [String:String] = [:]) async {
        guard let downloadedData: Post = await WebService().downloadData(fromURL: url, parameters: parameters) else {return}
        responseData = downloadedData
    }
}
