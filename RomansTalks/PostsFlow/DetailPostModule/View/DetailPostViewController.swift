//
//  DetailPostViewController.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 17.03.2023.
//

import UIKit
import SwiftUI

protocol DetailPostViewProtocol : AnyObject{
    var presenter : DetailPostPresenterProtocol! { get set }
    func commentsGettingSuccess(with comments: [Comment])
    func commentsGettingError(error: Error)
    func startAnimation(_ bool: Bool)
    func setPost(with post : Post)
}

class DetailPostViewController: UIViewController{

    let indicator = UIActivityIndicatorView(style: .large)
    var commentsTableView = UITableView()
    var post : Post?
    var comments : [Comment]?
    weak var presenter: DetailPostPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
        title = "Comments"
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
        print("detailVC \(error.localizedDescription)")
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
        if section == 0{
            return 1
        } else {
            return comments?.count ?? 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnedCell = UITableViewCell()
        if indexPath.section == 0{
            if let inheritedPostCell = commentsTableView.dequeueReusableCell(withIdentifier: Resources.Identifiers.detailPostCellID) as? DetailPostTableViewCell,
               let post = self.post{
                inheritedPostCell.configure(with: post)
                returnedCell = inheritedPostCell
            }
        } else {
            if let comments = self.comments,
               let commentCell = commentsTableView.dequeueReusableCell(withIdentifier: Resources.Identifiers.commentCellID) as? CommentsTableViewCell {
                commentCell.configure(with: comments[indexPath.row])
                returnedCell = commentCell
            }
        }
        return returnedCell
    }
    
    //sections
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return nil
        } else {
            return "Comments"
        }
    }

    // Метод позволяет работать с секцией
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        // Изменяем фон секции
        view.tintColor = .clear

        // Изменяем цвет текста для секции
        let header = view as! UITableViewHeaderFooterView
        header.textLabel?.textColor = .gray
    }

}

extension DetailPostViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // Количество секций
        return 2
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
extension DetailPostViewController {
    func createTableView() {
        //table view
        commentsTableView.dataSource = self
        commentsTableView.delegate = self
        commentsTableView.separatorStyle = .none
        commentsTableView.register(DetailPostTableViewCell.self,
                                   forCellReuseIdentifier: Resources.Identifiers.detailPostCellID)
        commentsTableView.register(CommentsTableViewCell.self,
                                   forCellReuseIdentifier: Resources.Identifiers.commentCellID)
        self.view.addSubview(commentsTableView)
        commentsTableView.translatesAutoresizingMaskIntoConstraints = false
        commentsTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        commentsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                                  constant: -MainTabBarController.tabBarHeight).isActive = true
        commentsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        commentsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
    }
}

//MARK: - SwiftUI Preview
extension DetailPostViewController {
    fileprivate static func returnMocDetailVC() -> DetailPostViewController {
        let detail = DetailPostViewController()
        detail.post = Post(userId: 1, id: 2, title: "fdkfkdlfkd", body: "ldfsalkfsdlakfldsaklsdklafkdlkafslfdklaskf")
        let comment = Comment(postId: 2, id: 3, name: "name", email: "email", body: "fksla;kfjfl;sjkal;fajfls;ajsldjfal;sdj;lafalfjaldsa;fjdsa")
        detail.comments = [comment, comment, comment, comment]
        return detail
    }
}


struct DetailViewControllerProvider: PreviewProvider {
    static var previews: some View {
        DetailPostViewController.returnMocDetailVC().showPreview()
    }
}
