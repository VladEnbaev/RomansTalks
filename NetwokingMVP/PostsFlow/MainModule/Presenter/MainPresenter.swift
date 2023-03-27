//
//  MainPresenter.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 14.03.2023.
//

import Foundation

protocol MainViewProtocol : AnyObject{
    var posts : [Post]? { get set }
    func success(with posts : [Post])
    func failure(error: Error)
    func startAnimation(_ bool: Bool)
}

protocol MainPresenterProrocol : AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: PostsFeedFlowCoordinatorProtocol)
    func getPosts()
    func didTappedOnPost(post: Post)
}

class MainPresenter : MainPresenterProrocol {
    weak var view : MainViewProtocol?
    let networkService : NetworkServiceProtocol
    let router : PostsFeedFlowCoordinatorProtocol
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol, router: PostsFeedFlowCoordinatorProtocol) {
        self.router = router
        self.networkService = networkService
        self.view = view
        getPosts()
    }

    func getPosts(){
        self.view?.startAnimation(true)
        networkService.getPosts(){ [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                print("ended")
                switch result {
                case .success(let recievedPosts):
                    guard let posts = recievedPosts else { return }
                    self.view?.success(with: posts)
                    self.view?.startAnimation(false)
                case .failure(let error):
                    self.view?.startAnimation(false)
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
    func didTappedOnPost(post: Post) {
        router.showDetail(with: post)
    }
    
}
