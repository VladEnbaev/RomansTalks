//
//  NetworkService.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 14.03.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getPosts(completionHandler: @escaping (Result<[Post]?, Error>) -> Void)
}

class NetworkService : NetworkServiceProtocol {
    func getPosts(completionHandler: @escaping (Result<[Post]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        guard let url = URL(string: urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            if let error = error{
                completionHandler(.failure(error))
            } else {
                do{
                    let posts = try JSONDecoder().decode([Post].self, from: data!)
                    completionHandler(.success(posts))
                } catch {
                    completionHandler(.failure(error))
                }
            }
        }.resume()
    }
    
    
}
