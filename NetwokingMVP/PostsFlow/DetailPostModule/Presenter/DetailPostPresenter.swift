//
//  DetailPostPresenter.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 17.03.2023.
//

import Foundation


protocol DetailPostViewProtocol : AnyObject{
    var presenter : DetailPostPresenterProtocol! { get set }
    func commentsGettingSuccess(with comments: [Comment])
    func commentsGettingError(error: Error)
    func startAnimation(_ bool: Bool)
    func setPost(with post : Post)
}

protocol DetailPostPresenterProtocol : AnyObject {
    init(view: DetailPostViewProtocol, networkService: NetworkServiceProtocol, post: Post)
    var post : Post? { get set }
    var comments : [Comment]? { get set }
    func getComments()
}

class DetailPostPresenter : DetailPostPresenterProtocol{
    
    var view : DetailPostViewProtocol
    var networkService : NetworkServiceProtocol
    var post: Post?
    var comments: [Comment]?
    
    required init(view: DetailPostViewProtocol, networkService: NetworkServiceProtocol, post: Post) {
        self.networkService = networkService
        self.post = post
        self.view = view
        self.view.setPost(with: post)
        getComments()
    }
    
    func getComments() {
        guard let postId = self.post?.id else { return }
        self.view.startAnimation(true)
        networkService.getComments(for: "\(postId)") { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let recievedComments):
                    guard let comments = recievedComments else { return }
                    self.view.startAnimation(false)
                    self.comments = comments
                    self.view.commentsGettingSuccess(with: comments)
                case .failure(let error):
                    self.view.startAnimation(false)
                    self.view.commentsGettingError(error: error)
                }
            }
        }
    }
}