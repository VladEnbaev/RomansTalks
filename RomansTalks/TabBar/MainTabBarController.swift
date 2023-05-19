//
//  MainTabBarController.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.04.2023.
//

import UIKit

class MainTabBarController: UITabBarController{
    
    var roundedRectLayer : CAShapeLayer? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        let newTabBarHeight : CGFloat = 125
        
        var newFrame = tabBar.frame
        newFrame.size.height = newTabBarHeight
        newFrame.origin.y = view.frame.size.height - newTabBarHeight
        
        tabBar.frame = newFrame
        
        drawTabBar()
    }
    
}

extension MainTabBarController {
    
    func setupViewControllers(_ viewControllers: [UIViewController]) {
        self.viewControllers = viewControllers
        viewControllers[0].tabBarItem.image = R.Images.Icons.TabBar.home
        viewControllers[1].tabBarItem.image = R.Images.Icons.TabBar.addPhoto
        viewControllers[2].tabBarItem.image = R.Images.Icons.TabBar.profile
    }
    
    func setupTabBar(){
        loadViewIfNeeded()
        setupAppearance()
        tabBar.clipsToBounds = true
        tabBar.barTintColor = R.Colors.background
        tabBar.itemWidth = 35
        tabBar.itemSpacing = 83
        tabBar.itemPositioning = .centered
        
        tabBar.tintColor = R.Colors.orange
        tabBar.unselectedItemTintColor = R.Colors.unselected
    }
    
    // func started from ios 15 
    private func setupAppearance(){
        let tabBarAppearance = UITabBarAppearance()
        tabBarAppearance.configureWithOpaqueBackground()
        tabBarAppearance.backgroundImage = UIImage(color: R.Colors.background)
        tabBarAppearance.shadowImage = UIImage(color: R.Colors.background)
        tabBar.standardAppearance = tabBarAppearance
        tabBar.scrollEdgeAppearance = tabBarAppearance
    }
    
    private func drawTabBar() {
        let offsetHorisontal : CGFloat = 21
        let topOffset : CGFloat = 16
        let bottomOffset : CGFloat = 34
        let width = tabBar.bounds.width - offsetHorisontal * 2
        let height = tabBar.bounds.height - topOffset - bottomOffset
        let rectX = tabBar.bounds.midX - width / 2
        let rectY = tabBar.bounds.minY + height / 2 - bottomOffset
        
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
