//
//  MainPresenter.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 14.03.2023.
//

import Foundation

protocol MainViewProtocol : AnyObject{
    func success()
    func failure(error: Error)
}

protocol MainPresenterProrocol : AnyObject {
    init(view: MainViewProtocol, networkService: NetworkServiceProtocol)
    var posts : [Post]? { get set }
    func getPosts()
}

class MainPresenter : MainPresenterProrocol {
    weak var view : MainViewProtocol?
    let networkService : NetworkServiceProtocol
    var posts : [Post]?
    
    required init(view: MainViewProtocol, networkService: NetworkServiceProtocol) {
        self.view = view
        self.networkService = networkService
        getPosts()
    }

    func getPosts(){
        networkService.getPosts(){ [weak self] result in
            guard let self = self else { return }
            DispatchQueue.main.async {
                switch result {
                case .success(let posts):
                    self.posts = posts
                    self.view?.success()
                case .failure(let error):
                    self.view?.failure(error: error)
                }
            }
        }
    }
    
}
