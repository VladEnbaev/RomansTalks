//
//  SetStoriesTableViewCell.swift
//  RomansTalks
//
//  Created by Влад Енбаев on 06.06.2023.
//

import UIKit

class SetStoriesTableViewCell: UITableViewCell {

    var images : [UIImage]?
    var collectionView : UICollectionView!
    
    var collectionViewHeight : CGFloat {
        return StoriesCollectionViewCell.Constants.size.rawValue + 2*StoriesCollectionViewCell.Constants.insetHorizontal.rawValue
    }
    var cellWidth : CGFloat {
        return StoriesCollectionViewCell.Constants.size.rawValue + 2*StoriesCollectionViewCell.Constants.insetVertical.rawValue
    }
    
    func configure(with images: [UIImage]) {
        self.images = images
        setupStroriesCollectionView()
        self.collectionView.reloadData()
    }
}

extension SetStoriesTableViewCell {
    
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
            make.height.equalTo(collectionViewHeight)
        }
    }
}

// MARK: - UICollectionViewDataSource
extension SetStoriesTableViewCell : UICollectionViewDataSource {
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
extension SetStoriesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: cellWidth, height: collectionViewHeight)
    }
}
