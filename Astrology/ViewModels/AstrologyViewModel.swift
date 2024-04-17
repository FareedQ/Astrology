//
//  PostViewModel.swift
//  ChatApp
//
//  Created by Fareed Quraishi on 2024-04-09.
//

import Foundation

@MainActor class AstrologyViewModel: ObservableObject {
    @Published var planets = [Planet]()
    
    let url = "https://fareedq.pythonanywhere.com/v1/all/"
    func fetchData(_ parameters: [String:String] = [:]) async {
        guard let downloadedData: [Planet] = await WebService().downloadData(fromURL: url, parameters: parameters) else {return}
        planets = downloadedData
    }
}
