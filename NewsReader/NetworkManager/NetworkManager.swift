//
//  NetworkManager.swift
//  NewsReader
//
//  Created by Антон Бобрышев on 28.09.2021.
//

import Foundation

final class NetworkManager {
    
    static let shared = NetworkManager()
    
    struct Constants {
        static let topHeadLinesURL = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=\(apiAccess)")
    }
    
    private init() {}
    
    public func getTopStories(completion: @escaping (Result<[Article], Error>)-> Void) {
        guard let url = Constants.topHeadLinesURL else {return}
        
        let task = URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
            } else if let data = data {
                do {
                    let result = try JSONDecoder().decode(NewsModel.self, from: data)
                    print("Articles: \(result.articles.count)")
                    completion(.success(result.articles))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        task.resume()
    }
    
}
