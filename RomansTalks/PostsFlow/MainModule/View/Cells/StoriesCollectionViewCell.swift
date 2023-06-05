//
//  StoriesCollectionViewCell.swift
//  RomansTalks
//
//  Created by Влад Енбаев on 06.06.2023.
//

import UIKit
import SnapKit

class StoriesCollectionViewCell: UICollectionViewCell {
    // MARK: - Public
    func configure(image: UIImage?) {
        imageView.image = image
    }

    // MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        initialize()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private properties
    private let imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
}

// MARK: - Private methods
private extension StoriesCollectionViewCell {
    func initialize() {
        contentView.addSubview(imageView)
        imageView.snp.makeConstraints { make in
            make.size.equalTo(60)
            make.edges.equalToSuperview().inset(5)
        }
    }
}
