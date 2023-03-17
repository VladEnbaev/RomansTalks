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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
        createTableView()
    }
}

extension MainViewController : MainViewProtocol {
    func failure(error: Error) {
        print(error.localizedDescription)
    }
    
    func success() {
        postsTableView.reloadData()
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

extension MainViewController : UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.posts?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostCellReuseIdentifier") as? PostTableViewCell,
           let presenterPosts = presenter?.posts{
            cell.configure(with: presenterPosts[indexPath.row])
            return cell
        }
        return UITableViewCell()
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.bounds.height / 3
    }
}
//MARK: - Create UI
extension MainViewController {
    func createTableView() {
        //table view
        postsTableView.dataSource = self
        postsTableView.delegate = self
        postsTableView.register(PostTableViewCell.self, forCellReuseIdentifier: "PostCellReuseIdentifier")
        self.view.addSubview(postsTableView)
        postsTableView.translatesAutoresizingMaskIntoConstraints = false
        postsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        postsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        postsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        postsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
}
