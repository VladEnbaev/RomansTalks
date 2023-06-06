//
//  StoriesCollectionViewCell.swift
//  RomansTalks
//
//  Created by Влад Енбаев on 06.06.2023.
//

import UIKit
import SnapKit

class StoriesCollectionViewCell: UICollectionViewCell {
    
    enum Constants : CGFloat {
        case size  = 70
        case insetHorizontal = 5
        case insetVertical = 10
    }
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.makeCornerRadius(radius: Constants.size.rawValue / 2)
        view.layer.borderWidth = 4
        view.layer.borderColor = R.Colors.orange.cgColor
        
        let borderLayer = CALayer()
        let size = (Constants.size.rawValue - 3)
        let borderFrame = CGRect(x: 1.5, y: 1.5, width: size, height: size)
        borderLayer.backgroundColor = UIColor.clear.cgColor
        borderLayer.frame = borderFrame
        borderLayer.cornerRadius = size / 2
        borderLayer.borderWidth = 5.0
        borderLayer.borderColor = R.Colors.background.cgColor
        view.layer.addSublayer(borderLayer)
        
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func configure(image: UIImage?) {
        imageView.image = image
    }
}

// MARK: - Private methods
private extension StoriesCollectionViewCell {
    func initialize() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.height.width.equalTo(Constants.size.rawValue)
            make.top.bottom.equalToSuperview().inset(Constants.insetHorizontal.rawValue)
            make.leading.trailing.equalToSuperview().inset(Constants.insetVertical.rawValue)
        }
    }
}
