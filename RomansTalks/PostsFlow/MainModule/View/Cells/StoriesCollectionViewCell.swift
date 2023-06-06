//
//  StoriesCollectionViewCell.swift
//  RomansTalks
//
//  Created by Влад Енбаев on 06.06.2023.
//

import UIKit
import SnapKit



class StoriesCollectionViewCell: UICollectionViewCell {
    
    private var imageView = UIImageView()
    private let plusImageView = UIImageView(image: R.Images.Icons.addNewStoryIcon)
    private var isFirst : Bool?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configure(image: UIImage?, isFirst: Bool) {
        imageView.image = image
        
        let size = StoriesSetTableViewCell.Constants.size.rawValue
        imageView.makeCornerRadius(radius: size / 2)
        imageView.layer.borderWidth = 4
        imageView.layer.borderColor = R.Colors.orange.cgColor
        
        imageView.clipsToBounds = true
        
        let borderLayer = CALayer()
        let borderSize = size - 3
        let borderFrame = CGRect(x: 1.5, y: 1.5, width: borderSize, height: borderSize)
        borderLayer.backgroundColor = UIColor.clear.cgColor
        borderLayer.frame = borderFrame
        borderLayer.cornerRadius = borderSize / 2
        borderLayer.borderWidth = 5.0
        borderLayer.borderColor = R.Colors.background.cgColor
        imageView.layer.addSublayer(borderLayer)
        
        plusImageView.isHidden = !isFirst
    }
}

// MARK: - Private methods
private extension StoriesCollectionViewCell {
    func initialize() {
        contentView.addSubview(imageView)
        contentView.addSubview(plusImageView)
        imageView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        plusImageView.snp.makeConstraints { make in
            make.center.equalTo(imageView)
            make.height.width.equalTo(20)
        }
    }
}
