//
//  WebService.swift
//  Astrology
//
//  Created by Fareed Quraishi on 2024-04-09.
//

import Foundation

enum NetworkError: Error {
    case badUrl
    case invalidRequest
    case badResponse
    case badStatus
    case failedToDecodeResponse
}

class WebService: Codable {
    func downloadData<T: Codable>(fromURL: String, parameters: [String:String]?) async -> T? {
        do {
            guard let endpoint = URL(string: fromURL) else { throw NetworkError.badUrl }
            var request = URLRequest(url: endpoint)
            if let parameters {
                request.httpMethod = "POST"
                request.setValue("application/json", forHTTPHeaderField: "Content-Type")
                request.httpBody = try? JSONSerialization.data(withJSONObject: parameters)
            }
            let (data, response) = try await URLSession.shared.data(for: request)
            guard let response = response as? HTTPURLResponse else { throw NetworkError.badResponse }
            guard response.statusCode >= 200 && response.statusCode < 300 else { throw NetworkError.badStatus }
            if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                // Use the JSON data here
                print("JSON response received: \(json)")
            } else {
                print("Failed to decode JSON")
            }
            guard let decodedResponse = try? JSONDecoder().decode(T.self, from: data) else {
                throw NetworkError.failedToDecodeResponse
            }
            
            return decodedResponse
        } catch NetworkError.badUrl {
            print("There was an error creating the URL")
        } catch NetworkError.badResponse {
            print("Did not get a valid response")
        } catch NetworkError.badStatus {
            print("Did not get a 2xx status code from the response")
        } catch NetworkError.failedToDecodeResponse {
            print("Failed to decode response into the given type")
        } catch {
            print("An error occured downloading the data")
        }
        
        return nil
    }
}
