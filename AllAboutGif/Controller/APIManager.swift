//
//  APIManager.swift
//  AllAboutGif
//
//  Created by Kaique Magno Dos Santos on 31/07/19.
//  Copyright © 2019 Kaique Magno Dos Santos. All rights reserved.
//

import Foundation

enum APIManager {
    
    static fileprivate let apiKey = "WH4VMWYLN2L0"
    
    /**
     Execute web request to retrieve random gifs for the given search term.
     */
    static func requestReandomGif(searchTerm:String, limit:Int = 8, completion: @escaping (Result<Response,Error>) -> ())
    {
        
        // make initial random request for the first 8 items using default locale of EN_US
        let searchRequest = URLRequest(url: URL(string: String(format: "https://api.tenor.com/v1/random?q=%@&key=%@&limit=%d",
                                                               searchTerm,
                                                               APIManager.apiKey,
                                                               limit))!)
        
        makeWebRequest(urlRequest: searchRequest, completion: completion)
    }
    
    /**
     Async URL requesting function.
     */
    static func makeWebRequest(urlRequest: URLRequest, completion: @escaping (Result<Response,Error>) -> ())
    {
        // Make the async request and pass the resulting json object to the callback
        let task = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let data = data,
                let _ = response {
                do {
                    let value = try JSONDecoder().decode(Response.self, from: data)
                    completion(.success(value))
                } catch {
                    completion(.failure(error))
                }
            
            }else if let error = error{
                completion(.failure(error))
            
            }else{
                fatalError("API Could not be described")
            }
        }
        task.resume()
    }
    
    /**
     Web response handler for search requests.
     */
    static func tenorRandomSearchHandler(response: Response)
    {
        
        // Load the GIFs into your view
        print("Result GIFS: (responseGifs)")
        
    }
    
}
