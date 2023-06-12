//
//  ApiClient.swift
//  Poker Tutorials and Practice Exercises
//
//  Created by Mac on 08/06/2023.
//

import Foundation


class ApiClient {
    static var path:String = ""
    static let shared = ApiClient()
    private init(){}
    // load general info
    func loadGeneralInfo(about:String,completion:@escaping(Result<PokerResponse,Error>)->()) {
        
        // Create a base URL
        guard var components = URLComponents(string: "https://en.wikipedia.org/w/api.php?") else {
            // Handle invalid base URL
            return
        }
        
        // Create an array of URLQueryItem for your parameters
        let params = [
            URLQueryItem(name: "action", value: "query"),
            URLQueryItem(name: "titles", value: about),
            URLQueryItem(name: "prop", value: "extracts"),
            URLQueryItem(name: "format", value: "json")
        ]
        
        // Append the parameters to the URL components
        components.queryItems = params
        
        // Construct the final URL
        guard let url = components.url else {
            // Handle invalid URL
            return
        }
        
        // Create the request
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        // Create the URLSession data task
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                // Handle the error
                print("Error: \(error)")
                return
            }
            guard let httpResponse = response as? HTTPURLResponse,
                     (200...299).contains(httpResponse.statusCode) else {
                   print("Invalid response")
                   return
               }
            guard let jsonData = data else {
                // Handle empty response data
                print("Empty response data")
                return
            }
            
            // Parse and process the response data
            do {
                let decoder = JSONDecoder()
                      let pokerResponse = try decoder.decode(PokerResponse.self, from: jsonData)
                completion(.success(pokerResponse))
            } catch {
                // Handle JSON parsing error
                completion(.failure(error))
                print("Error parsing JSON: \(error)")
            }
        }
        
        // Start the data task
        task.resume()
        
    }
    
    
}
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)
struct PokerResponse: Codable {
    let batchcomplete: String?
    let warnings: Warnings?
    let query: Query?
}

struct Warnings: Codable {
    let extracts: Extracts?
}

struct Extracts: Codable {
    let html: String?
}

struct Query: Codable {
    let pages: [String: Page]?
}

struct Page: Codable {
    let pageid: Int?
    let ns: Int?
    let title: String?
    let extract: String?
    let sections: [Section]?
}

struct Section: Codable {
    let id: String?
    let title: String?
    let content: String?
}
