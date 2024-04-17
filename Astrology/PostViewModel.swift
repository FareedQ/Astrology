//
//  PostViewModel.swift
//  ChatApp
//
//  Created by Fareed Quraishi on 2024-04-09.
//

import Foundation

@MainActor class PostViewModel: ObservableObject {
    @Published var postData = [Planet]()
    
    func fetchData(_ parameters: [String:String]?) async {
        guard let downloadedPosts: [Planet] = await WebService().downloadData(fromURL: "https://fareedq.pythonanywhere.com/v1/all/", parameters: parameters) else {return}
        postData = downloadedPosts
    }
}
