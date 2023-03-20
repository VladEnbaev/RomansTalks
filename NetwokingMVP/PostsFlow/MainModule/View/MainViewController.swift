//
//  ViewController.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 14.03.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let indicator = UIActivityIndicatorView(style: .large)
    var postsTableView = UITableView()
    var presenter : MainPresenterProrocol! 
    var posts : [Post]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        createTableView()
    }
}

extension MainViewController : MainViewProtocol {
    func success(with posts: [Post]) {
        self.posts = posts
        self.postsTableView.reloadData()
    }
    
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    func startAnimation(_ bool: Bool) {
        indicator.translatesAutoresizingMaskIntoConstraints = false
        indicator.hidesWhenStopped = true
        if bool {
            view.addSubview(indicator)
            indicator.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = bool
            indicator.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = bool
            indicator.heightAnchor.constraint(equalToConstant: 70).isActive = bool
            indicator.widthAnchor.constraint(equalToConstant: 70).isActive = bool
            indicator.startAnimating()
        } else {
            indicator.stopAnimating()
        }
    }

}

extension MainViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: Resources.Identifiers.postCellID) as? PostTableViewCell,
           let presenterPosts = self.posts{
            cell.configure(with: presenterPosts[indexPath.row])
            return cell
        }
        return UITableViewCell()
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height / 3
    }
}
extension MainViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailPost = posts?[indexPath.row] else { return }
        presenter.didTappedOnPost(post: detailPost)
    }
}
//MARK: - Create UI
extension MainViewController {
    func createTableView() {
        //table view
        postsTableView.dataSource = self
        postsTableView.delegate = self
        postsTableView.register(PostTableViewCell.self, forCellReuseIdentifier: Resources.Identifiers.postCellID)
        self.view.addSubview(postsTableView)
        postsTableView.translatesAutoresizingMaskIntoConstraints = false
        postsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        postsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        postsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        postsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
}
