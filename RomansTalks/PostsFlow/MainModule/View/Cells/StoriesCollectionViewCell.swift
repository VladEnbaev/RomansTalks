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
        case inset = 15
    }
    
    private let imageView: UIImageView = {
        let view = UIImageView()
        view.makeCornerRadius(radius: Constants.size.rawValue / 2)
        view.layer.borderWidth = 3
        view.layer.borderColor = R.Colors.orange.cgColor
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
            make.edges.equalToSuperview().inset(Constants.inset.rawValue)
        }
    }
}
