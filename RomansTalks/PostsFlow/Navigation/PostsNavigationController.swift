//
//  PostsNavigationController.swift
//  RomansTalks
//
//  Created by Влад Енбаев on 31.05.2023.
//

import UIKit
import SnapKit

class PostsNavigationControlller : UINavigationController {
    override func viewDidLoad() {
        super.viewDidLoad()
        let height: CGFloat = 100 //whatever height you want to add to the existing height
        let bounds = self.navigationBar.bounds
        self.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: height)
    }
    
    func setup() {
        navigationBar.backIndicatorTransitionMaskImage = UIImage()
        navigationBar.backIndicatorImage = UIImage()
        navigationBar.tintColor = .black
        constraintNavBar()
    }
    
    private func constraintNavBar() {
//        NSLayoutConstraint.activate([
//            navigationBar.topAnchor.constraint(equalTo: view.topAnchor),
//            navigationBar.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.3),
//            navigationBar.leadingAnchor.constraint(equalTo: view.leadingAnchor),
//            navigationBar.trailingAnchor.constraint(equalTo: view.trailingAnchor)
//        ])
//        navigationBar.snp.makeConstraints(){ make in
//            make.trailing.leading.equalToSuperview()
//            make.height.equalToSuperview().multipliedBy(0.5)
//            make.top.equalToSuperview()
//        }
    }
}
