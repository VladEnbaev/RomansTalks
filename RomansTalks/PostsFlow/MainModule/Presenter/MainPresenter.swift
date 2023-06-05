//
//  MainPresenter.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 14.03.2023.
//

import Foundation
import UIKit


protocol MainPresenterProrocol : AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: PostsFeedFlowCoordinatorProtocol)
    func getPosts()
    func didTappedOnPost(post: Post)
    func loadImages()
}

class MainPresenter : MainPresenterProrocol {
    weak var view : MainViewProtocol?
    let networkService : NetworkServiceProtocol
    let coordinator : PostsFeedFlowCoordinatorProtocol
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: PostsFeedFlowCoordinatorProtocol) {
        self.coordinator = router
        self.networkService = networkService
        self.view = view
        getPosts()
        loadImages()
    }

    func getPosts(){
        self.view?.startAnimation(true)
        networkService.getPosts(){ [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self.getUsersAndCompareWithPosts(posts: posts)
                case .failure(let error):
                    self.view?.startAnimation(false)
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    private func getUsersAndCompareWithPosts(posts: [Post]) {
        networkService.getUsers() { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let users):
                    var postsWithUsers = self?.compare(posts: posts, users: users) ?? []
                    // random feed
                    postsWithUsers.shuffle()
                    self?.view?.success(with: postsWithUsers)
                    self?.view?.startAnimation(false)
                case .failure(let error):
                    self?.view?.startAnimation(false)
                    self?.view?.failure(error: error)
                }
            }
        }
    }
    private func compare(posts: [Post], users: [User]) -> [Post] {
        var newPosts = posts
        for i in 0..<posts.count {
            for j in 0..<users.count {
                if newPosts[i].userId == users[j].id {
                    newPosts[i].user = users[j]
                }
            }
        }
        return newPosts
    }
    
    
    func didTappedOnPost(post: Post) {
        networkService.getUser(id: post.userId) { result in
            DispatchQueue.main.async {
                switch result {
                case .success(let user):
                    var postWithUser = post
                    postWithUser.user = user.first
                    self.coordinator.showDetail(with: postWithUser)
                    self.view?.startAnimation(false)
                case .failure(let error):
                    self.view?.startAnimation(false)
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func loadImages() {
        let imageIDs = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        var images: [UIImage] = []
        
        let group = DispatchGroup()
        
        imageIDs.forEach {
            group.enter()
            networkService.loadImage(id: $0) {result in
                switch result{
                case .success(let image):
                    images.append(image)
                    group.leave()
                case .failure(let error):
                    self.view?.failure(error: error)
                    
                }
            }
        }
        
        group.notify(queue: .main) {
            self.view?.success(with: images)
            
        }
    }
}

//    func getUserWithId(_ id: Int, completion: ([User]) -> Void) {
//        networkService.getUser(id: id) { result in
//            DispatchQueue.main.async {
//                switch result {
//                case .success(let user):
//                    var postWithUser = post
//                    postWithUser.user = user.first
//                    self.coordinator.showDetail(with: postWithUser)
//                    self.view?.startAnimation(false)
//                case .failure(let error):
//                    self.view?.startAnimation(false)
//                    self.view?.failure(error: error)
//                }
//            }
//        }
//    }
