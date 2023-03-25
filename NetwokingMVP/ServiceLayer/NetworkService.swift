//
//  NetworkService.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 14.03.2023.
//

import Foundation

protocol NetworkServiceProtocol {
    func getPosts(completionHandler: @escaping (Result<[Post]?, Error>) -> Void)
    func getComments(for postId: String, completionHandler: @escaping (Result<[Comment]?, Error>) -> Void)
}

class NetworkService : NetworkServiceProtocol {
    func getComments(for postId: String, completionHandler: @escaping (Result<[Comment]?, Error>) -> Void) {
        print(postId)
        let urlString = "https://jsonplaceholder.typicode.com/comments"
        
        guard let myUrl = URL(string: urlString) else { return }
        var queryComponents = URLComponents(url: myUrl, resolvingAgainstBaseURL: true)
        queryComponents?.queryItems = [ URLQueryItem(name: "postId", value: postId)]
        guard let queryURL = queryComponents?.url else { return }
        
        resumeURLSessionShared(with: queryURL, completionHandler: completionHandler)
    }
    
    
    func getPosts(completionHandler: @escaping (Result<[Post]?, Error>) -> Void) {
        let urlString = "https://jsonplaceholder.typicode.com/posts"
        resumeURLSessionShared(with: urlString, completionHandler: completionHandler)
    }
    
    private func resumeURLSessionShared<T>(with url: URL, completionHandler: @escaping (Result<[T]?, Error>) -> Void)  where T : Decodable {
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            if let error = error{
                completionHandler(.failure(error))
            } else {
                do{
                    let posts = try JSONDecoder().decode([T].self, from: data!)
                    completionHandler(.success(posts))
                } catch {
                    completionHandler(.failure(error))
                }
            }
        }.resume()
    }
    
    private func resumeURLSessionShared<T>(with urlString: String, completionHandler: @escaping (Result<[T]?, Error>) -> Void)  where T : Decodable {
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            if let error = error{
                completionHandler(.failure(error))
            } else {
                do{
                    let posts = try JSONDecoder().decode([T].self, from: data!)
                    completionHandler(.success(posts))
                } catch {
                    completionHandler(.failure(error))
                }
            }
        }.resume()
    }
}
