//
//  MainTabBarController.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.04.2023.
//

import UIKit
import SwiftUI
import SnapKit

class MainTabBarController: UITabBarController{
    
    private(set) static var tabBarHeight : CGFloat = 125
    
    var roundedRectLayer : CAShapeLayer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let newTabBarHeight : CGFloat = self.view.bounds.height * 0.15
        MainTabBarController.tabBarHeight = newTabBarHeight
        
        var newFrame = tabBar.frame
        newFrame.size.height = newTabBarHeight
        newFrame.origin.y = view.frame.size.height - newTabBarHeight
        
        tabBar.frame = newFrame
        
        drawTabBarRectangle()
    }
    
}

extension MainTabBarController {
    
    func setupViewControllers(_ viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
        viewControllers[0].tabBarItem.image = R.Images.Icons.TabBar.home
        viewControllers[1].tabBarItem.image = R.Images.Icons.TabBar.addPhoto
        viewControllers[2].tabBarItem.image = R.Images.Icons.TabBar.profile
        setupTabBar()
    }
    
    private func setupTabBar() {
        loadViewIfNeeded()
        setupAppearance()
        tabBar.clipsToBounds = true
        tabBar.barTintColor = R.Colors.background
        tabBar.itemWidth = 30
        tabBar.itemPositioning = .automatic
        tabBar.itemSpacing = 83
        tabBar.tintColor = R.Colors.orange
        tabBar.unselectedItemTintColor = R.Colors.unselected
    }
    
    private func setupAppearance(){
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundImage = UIImage(color: R.Colors.background)
        tabBarAppearance.shadowImage = UIImage(color: R.Colors.background)
        tabBar.standardAppearance = tabBarAppearance
        if #available(iOS 15.0, *) {
            tabBar.scrollEdgeAppearance = tabBarAppearance
        } else {
            // Fallback on earlier versions
        }
    }
    
    private func setupTabBarItems() {
        let bottomSafeAreaOffset = view.safeAreaInsets.bottom / 2
        let tabBarButtonsOffset : CGFloat =  bottomSafeAreaOffset - 3
        
        let items = tabBar.items ?? []
        for item in items {
            item.imageInsets = UIEdgeInsets(top: tabBarButtonsOffset,
                                            left: 0,
                                            bottom: -tabBarButtonsOffset,
                                            right: 0)
        }
    }
    
    
    private func drawTabBarRectangle() {
        let offsetHorisontal : CGFloat = 21
        let offsetFromSafeArea : CGFloat = 7
        let width : CGFloat  = tabBar.bounds.width - offsetHorisontal * 2
        let height : CGFloat = 75
        let rectX : CGFloat = tabBar.bounds.midX - width / 2
        let rectY : CGFloat = tabBar.bounds.midY - height / 2 - offsetFromSafeArea
        
        setupTabBarItems()
        
        let roundLayer = CAShapeLayer()
        
        let rectangle = CGRect(x: rectX,
                               y: rectY,
                               width: width,
                               height: height)
        
        let bezierPath = UIBezierPath(roundedRect: rectangle, cornerRadius: 20)
        
        roundLayer.path = bezierPath.cgPath
        roundLayer.fillColor = R.Colors.darkGrey.cgColor
        
        if let oldRoundedLayer = self.roundedRectLayer {
            tabBar.layer.replaceSublayer(oldRoundedLayer, with: roundLayer)
        } else {
            tabBar.layer.insertSublayer(roundLayer, at: 0)
        }
        
        self.roundedRectLayer = roundLayer
    }
}

//MARK: - SwiftUI Preview
extension MainTabBarController {
    fileprivate func returnMocTabBarVC() -> MainTabBarController {
        let mocTabBar = MainTabBarController()
        let mocVC = UIViewController()
        mocVC.view.backgroundColor = .gray
        mocTabBar.setupViewControllers([
            mocVC,
            UIViewController(),
            UIViewController(),
        ])
        mocTabBar.setupTabBar()
        return mocTabBar
    }
}

struct ViewControllerProvider: PreviewProvider {
    static var previews: some View {
        MainTabBarController().returnMocTabBarVC().showPreview()
    }
}
