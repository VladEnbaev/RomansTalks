//
//  DetailPostViewController.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 17.03.2023.
//

import UIKit

class DetailPostViewController: UIViewController{

    let indicator = UIActivityIndicatorView(style: .large)
    var commentsTableView = UITableView()
    var post : Post?
    var comments : [Comment]?
    weak var presenter: DetailPostPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
    }
    
}

extension DetailPostViewController : DetailPostViewProtocol {
    
    func commentsGettingSuccess(with comments: [Comment]) {
        loadViewIfNeeded()
        self.comments = comments
        commentsTableView.reloadData()
    }
    
    func commentsGettingError(error: Error) {
        let alert = UIAlertController(title: "ops",
                                      message: error.localizedDescription,
                                      preferredStyle: .alert)
        let okButton = UIAlertAction(title: "ok", style: .default)
        alert.addAction(okButton)
        self.present(alert, animated: true)
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
    
    func setPost(with post: Post) {
        loadViewIfNeeded()
        self.post = post
        commentsTableView.reloadData()
    }
}

extension DetailPostViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let commentsCount = self.comments?.count, self.post != nil{
            return 1 + commentsCount
        } else if self.post != nil{
            return 1
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnedCell = UITableViewCell()
        if indexPath.row == 0{
            if let inheritedPostCell = commentsTableView.dequeueReusableCell(withIdentifier: Resources.Identifiers.detailPostCellID) as? DetailPostTableViewCell,
               let post = self.post{
                inheritedPostCell.configure(with: post)
                returnedCell = inheritedPostCell
            }
        } else {
            if let comments = self.comments,
               let commentCell = commentsTableView.dequeueReusableCell(withIdentifier: Resources.Identifiers.commentCellID) as? CommentsTableViewCell {
                commentCell.configure(with: comments[indexPath.row - 1])
                returnedCell = commentCell
            }
        }
        return returnedCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return self.view.bounds.height / 2
        } else {
            return self.view.bounds.height / 4
        }
    }
}

extension DetailPostViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

//MARK: - Create UI
extension DetailPostViewController {
    func createTableView() {
        //table view
        commentsTableView.dataSource = self
        commentsTableView.delegate = self
        commentsTableView.register(DetailPostTableViewCell.self,
                                   forCellReuseIdentifier: Resources.Identifiers.detailPostCellID)
        commentsTableView.register(CommentsTableViewCell.self,
                                   forCellReuseIdentifier: Resources.Identifiers.commentCellID)
        self.view.addSubview(commentsTableView)
        commentsTableView.translatesAutoresizingMaskIntoConstraints = false
        commentsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        commentsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        commentsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        commentsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
}
