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
    }
    
    func setup() {
//        let height: CGFloat = 200
//        let bounds = self.navigationBar.bounds
//        self.navigationBar.frame = CGRect(x: 0, y: 0, width: bounds.width, height: height)
        
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20,
                                                                         weight: .bold)]
        UINavigationBar.appearance().titleTextAttributes = attributes
        
        navigationBar.isTranslucent = true
        navigationBar.backgroundColor = R.Colors.background
        navigationBar.backIndicatorTransitionMaskImage = UIImage()
        navigationBar.backIndicatorImage = UIImage()
        navigationBar.tintColor = .black
    }
}
