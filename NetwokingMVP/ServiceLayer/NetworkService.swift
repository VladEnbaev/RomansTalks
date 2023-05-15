//
//  NetworkService.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 14.03.2023.
//

import Foundation



fileprivate enum APIs {
    static let posts = "/posts"
    static let users = "/users"
    static let comments = "/comments"
    static let photos = "/photos"
    static let albums = "/albums"
    static let todos = "/todos"
}

fileprivate enum HTTPMethod {
    static let post = "POST"
    static let put = "PUT"
    static let get = "GET"
    static let delete = "DELETE"
}

protocol NetworkServiceProtocol {
    func getPosts(completionHandler: @escaping (Result<[Post], Error>) -> Void)
    func getComments(for postId: String, completionHandler: @escaping (Result<[Comment], Error>) -> Void)
    func postCreateUser(_ user: User, complitionHandler: @escaping (Result<User, Error>) -> Void)
    func getUser(id: Int, compitionHandler: @escaping (Result<[User], Error>) -> Void)
    func getPost(id: Int, completionHandler: @escaping (Result<[Post], Error>) -> Void)
}

class NetworkService : NetworkServiceProtocol {
    
    private let baseURL = "https://jsonplaceholder.typicode.com"
    
    func getComments(for postId: String, completionHandler: @escaping (Result<[Comment], Error>) -> Void) {
        let urlString = baseURL + APIs.comments
        
        guard let myUrl = URL(string: urlString) else { return }
        var queryComponents = URLComponents(url: myUrl, resolvingAgainstBaseURL: true)
        queryComponents?.queryItems = [ URLQueryItem(name: "postId", value: postId)]
        guard let queryURL = queryComponents?.url else { return }
        
        getURLSession(with: queryURL, completionHandler: completionHandler)
    }
    
    func getPost(id: Int, completionHandler: @escaping (Result<[Post], Error>) -> Void) {
        let urlString = baseURL + APIs.posts
        guard let url = URL(string: urlString) else { return }
        
        var queryComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        queryComponents?.queryItems = [ URLQueryItem(name: "id", value: "\(id)") ]
        guard let queryURL = queryComponents?.url else { return }
        print(queryURL.absoluteString)
        
        getURLSession(with: url, completionHandler: completionHandler)
    }
    
    func getPosts(completionHandler: @escaping (Result<[Post], Error>) -> Void) {
        let urlString = baseURL + APIs.posts
        guard let url = URL(string: urlString) else { return }
        
        getURLSession(with: url, completionHandler: completionHandler)
    }
    
    func postCreateUser(_ user: User, complitionHandler: @escaping (Result<User, Error>) -> Void) {
        let urlString = baseURL + APIs.users
        guard let url = URL(string: urlString) else { return }
        
        postURLSession(url: url, data: user, complitionHandler: complitionHandler)
    }
    
    
    
//    func getPostWithUser(id: Int, completionHandler: @escaping (Result<[Post], Error>) -> Void) {
//        
//        let posts = [Post]()
//        
//        let compareUserWithPost : (Result<[User], Error>) -> Void = { result in
//            switch result {
//            case .success(let users as! [User]):
//                var user = users[0]
//                posts[0].user = user
//                completionHandler(.success(posts))
//            case .failure(let error):
//                completionHandler(.failure(error))
//            }
//        }
//        
//        getPost(id: id) { result in
//            switch result {
//            case .success(let recievedPosts):
//                posts = recievedPosts
//                self.getUser(userId: posts[0].userId, completionHandler: compareUserWithPost)
//            case .failure(let error):
//                completionHandler(.failure(error))
//            }
//        }
//    }
    
    func getUser(id: Int, compitionHandler: @escaping (Result<[User], Error>) -> Void) {
        let urlString = baseURL + APIs.users
        guard let url = URL(string: urlString) else { return }
        
        var queryComponents = URLComponents(url: url, resolvingAgainstBaseURL: true)
        queryComponents?.queryItems = [ URLQueryItem(name: "id", value: "\(id)") ]
        guard let queryURL = queryComponents?.url else { return }
        print(queryURL.absoluteString)
        getURLSession(with: queryURL, completionHandler: compitionHandler)
    }
    
    

    private func postURLSession<T>(url: URL, data: T, complitionHandler: @escaping (Result<T, Error>) -> Void) where T: Codable {
        guard let sendData = try? JSONEncoder().encode(data) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = HTTPMethod.post
        request.httpBody = sendData
        request.setValue("\(sendData.count)", forHTTPHeaderField: "Content-Lengh")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let httpError = error {
                complitionHandler(.failure(httpError))
            } else if let httpResponse = response as? HTTPURLResponse, (200...299).contains(httpResponse.statusCode), let responseData = data {
                do {
                    let responseModel : T = try JSONDecoder().decode(T.self, from: responseData)
                    complitionHandler(.success(responseModel))
                } catch {
                    complitionHandler(.failure(error))
                }
            }
        }.resume()
    }
    
    private func getURLSession<T>(with url: URL, completionHandler: @escaping (Result<[T], Error>) -> Void)  where T : Decodable {
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in
            guard let data = data else { return }
            if let error = error{
                completionHandler(.failure(error))
            } else {
                do{
                    let posts = try JSONDecoder().decode([T].self, from: data)
                    completionHandler(.success(posts))
                } catch {
                    debugPrint(error)
                    completionHandler(.failure(error))
                }
            }
        }.resume()
        
    }
}


