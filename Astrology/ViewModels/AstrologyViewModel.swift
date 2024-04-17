//
//  PostViewModel.swift
//  ChatApp
//
//  Created by Fareed Quraishi on 2024-04-09.
//

import Foundation

@MainActor class AstrologyViewModel: ObservableObject {
    @Published var planets = [Planet]()
    
    func fetchData(_ parameters: [String:String] = [:]) async {
        guard let downloadedData: [Planet] = await WebService().downloadData(fromURL: "https://fareedq.pythonanywhere.com/v1/all/", parameters: parameters) else {return}
        planets = downloadedData
    }
}
