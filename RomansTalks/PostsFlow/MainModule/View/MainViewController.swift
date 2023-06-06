//
//  ViewController.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 14.03.2023.
//

import UIKit
import SwiftUI
import SnapKit

protocol MainViewProtocol : AnyObject {
    func success(with posts : [Post])
    func success(with images: [UIImage])
    func failure(error: Error)
    func startAnimation(_ bool: Bool)
}

class MainViewController: UIViewController {
    
    let indicator = UIActivityIndicatorView(style: .large)
    var postsTableView = UITableView()
    var storiesCollectionView : UICollectionView!
    var presenter : MainPresenterProrocol!
    
    var posts : [Post]?
    var images : [UIImage]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        title = "Posts Feed"
        
        setupPostsTableView()
        setupStroriesCollectionView()
        setupNavigationBar()
        
        constraintViews()
    }
}
//MARK: -MainViewProtocol
extension MainViewController : MainViewProtocol {
    func success(with posts: [Post]) {
        self.posts = posts
        self.postsTableView.reloadData()
    }
    func success(with images: [UIImage]) {
        self.images = images
        self.storiesCollectionView.reloadData()
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

//MARK: - Create UI
extension MainViewController {
    func setupPostsTableView() {
        //table view
        postsTableView.dataSource = self
        postsTableView.delegate = self
        postsTableView.register(PostTableViewCell.self, forCellReuseIdentifier: Resources.Identifiers.postCellID)
        
        postsTableView.separatorStyle = .none
    }
    
    func setupStroriesCollectionView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        storiesCollectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        storiesCollectionView.register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        storiesCollectionView.backgroundColor = .black
        storiesCollectionView.dataSource = self
        storiesCollectionView.delegate = self
        storiesCollectionView.showsHorizontalScrollIndicator = false
    }
    
    
    func setupNavigationBar() {
        let backIcon = R.Images.Icons.back
        let barItem = UIBarButtonItem(image: backIcon, style: .plain, target: nil, action: nil)
        barItem.tintColor = R.Colors.backArrowColor
        navigationItem.backBarButtonItem = barItem
    }
    
    func constraintViews() {
        view.addSubview(postsTableView)
        postsTableView.translatesAutoresizingMaskIntoConstraints = false
        postsTableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
        postsTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor,
                                               constant: 0).isActive = true
        postsTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        postsTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        
        view.addSubview(storiesCollectionView)
        storiesCollectionView.snp.makeConstraints { make in
            make.leading.equalToSuperview()//.inset(PostTableViewCell.Constants.contentOffset.rawValue)
            make.trailing.equalToSuperview()
            make.top.equalToSuperview().inset(90)
            make.height.equalTo(100)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension MainViewController : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images?.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StoriesCollectionViewCell
        cell.configure(image: (images?[indexPath.item] ?? UIImage()) )
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = StoriesCollectionViewCell.Constants.size.rawValue + 2*StoriesCollectionViewCell.Constants.inset.rawValue
        return CGSize(width: height, height: height)
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
        if let cell = tableView.cellForRow(at: indexPath) as? PostTableViewCell {
            UIView.animate(withDuration: 0.2) {
                cell.curvedView.alpha = 0.4
            }
        }
    }
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        // Опциональная привязка, проверка на nil
        // TableViewCellForService – это ваш класс
        if let cell = tableView.cellForRow(at: indexPath) as? PostTableViewCell {
            UIView.animate(withDuration: 0.2) {
                cell.curvedView.alpha = 1
            }
        }
    }
}

//MARK: -SwiftUI Preview
extension MainViewController {
    fileprivate static func returnMocVC() -> MainViewController {
        let image = UIImage(systemName: "trash")!.withTintColor(.red)
        let images = [image, image , image , image]
        let mainVC = MainViewController()
        mainVC.images = images
        
        return mainVC
    }
}

struct MainViewPreview : PreviewProvider {
    static var previews: some View {
        MainViewController.returnMocVC().showPreview()
    }
}
