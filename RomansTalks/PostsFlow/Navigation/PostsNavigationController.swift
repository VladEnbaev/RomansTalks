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
        let attributes = [NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20,
                                                                         weight: .bold)]
        UINavigationBar.appearance().titleTextAttributes = attributes
        navigationBar.backIndicatorTransitionMaskImage = UIImage()
        navigationBar.backIndicatorImage = UIImage()
    }
}
