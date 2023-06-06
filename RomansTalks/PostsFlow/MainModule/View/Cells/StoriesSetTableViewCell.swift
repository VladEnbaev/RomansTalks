//
//  SetStoriesTableViewCell.swift
//  RomansTalks
//
//  Created by Влад Енбаев on 06.06.2023.
//

import UIKit

class StoriesSetTableViewCell: UITableViewCell {

    var images : [UIImage]?
    var collectionView : UICollectionView!
    
    enum Constants : CGFloat {
        case size  = 70
        case insetHorizontal = 10
        case insetVertical = 15
    }
    
    func configure(with images: [UIImage]) {
        self.images = images
        setupStroriesCollectionView()
        self.collectionView.reloadData()
    }
}

extension StoriesSetTableViewCell {
    
    func setupStroriesCollectionView() {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.register(StoriesCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        
        constraintViews()
    }
    
    func constraintViews() {
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
            make.height.equalTo(Constants.size.rawValue)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension StoriesSetTableViewCell : UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return (images?.count ?? 0) + 1
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! StoriesCollectionViewCell
        if indexPath.row == 0 {
            cell.configure(image: R.Images.Photos.none, isFirst: true)
        } else {
            cell.configure(image: (images?[indexPath.row - 1] ?? UIImage()), isFirst: false )
        }
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension StoriesSetTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: Constants.size.rawValue, height: Constants.size.rawValue)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: Constants.insetHorizontal.rawValue,
                            left: Constants.insetVertical.rawValue,
                            bottom: Constants.insetHorizontal.rawValue,
                            right: Constants.insetVertical.rawValue)
    }
}
