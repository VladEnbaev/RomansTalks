//
//  ViewController.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 14.03.2023.
//

import UIKit

protocol MainViewProtocol : AnyObject{
    var posts : [Post]? { get set }
    func success(with posts : [Post])
    func failure(error: Error)
    func startAnimation(_ bool: Bool)
}

class MainViewController: UIViewController {
    
    let indicator = UIActivityIndicatorView(style: .large)
    var postsTableView = UITableView()
    var presenter : MainPresenterProrocol!
    var posts : [Post]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        title = "Posts Feed"
        
        setupPostsTableView()
        setupNavigationBar()
    }
}
//MARK: -MainViewProtocol
extension MainViewController : MainViewProtocol {
    func success(with posts: [Post]) {
        self.posts = posts
        self.postsTableView.reloadData()
    }
    
    func failure(error: Error) {
        let alert = UIAlertController(title: "ops",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
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
//MARK: -UITableViewDataSource
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
}

//MARK: -UITableViewDelegate
extension MainViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailPost = posts?[indexPath.row] else { return }
        presenter.didTappedOnPost(post: detailPost)
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        // Опциональная привязка, проверка на nil
        // TableViewCellForService – это ваш класс
        if let cell = tableView.cellForRow(at: indexPath) as? DetailPostTableViewCell {
            UIView.animate(withDuration: 0.2) {
                cell.curvedView.alpha = 0.4
            }
        }
    }
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        // Опциональная привязка, проверка на nil
        // TableViewCellForService – это ваш класс
        if let cell = tableView.cellForRow(at: indexPath) as? DetailPostTableViewCell {
            UIView.animate(withDuration: 0.2) {
                cell.curvedView.alpha = 1
            }
        }
    }
}
//MARK: - Create UI
extension MainViewController {
    func setupPostsTableView() {
        //table view
        postsTableView.dataSource = self
        postsTableView.delegate = self
        postsTableView.register(PostTableViewCell.self, forCellReuseIdentifier: Resources.Identifiers.postCellID)
        
        postsTableView.separatorStyle = .none
        
        view.addSubview(postsTableView)
        postsTableView.translatesAutoresizingMaskIntoConstraints = false
        postsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        postsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                               constant: 0).isActive = true
        postsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        postsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
    
    func setupNavigationBar() {
        let backIcon = R.Images.Icons.back
        let barItem = UIBarButtonItem(image: backIcon, style: .plain, target: nil, action: nil)
        barItem.tintColor = R.Colors.backArrowColor
        navigationItem.backBarButtonItem = barItem
    }
}
