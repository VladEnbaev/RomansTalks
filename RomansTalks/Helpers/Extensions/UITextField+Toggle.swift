//
//  HelpfulFuncs.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 25.03.2023.
//

import Foundation
import UIKit

extension UITextField {
    fileprivate func setPasswordToggleImage(_ button: UIButton) {
        if (isSecureTextEntry){
            button.setImage(UIImage(systemName: "eye.circle"), for: .normal)
        }else{
            button.setImage(UIImage(systemName: "eye.slash.circle"), for: .normal)

        }
    }

//    func createPasswordToggle(){
//        let button = UIButton(type: .custom)
//        setPasswordToggleImage(button)
//        var filled = UIButton.Configuration.plain()
//        filled.baseForegroundColor = .placeholderText
//        filled.imagePlacement = .trailing
//        filled.imagePadding = 15
//        button.configuration = filled
//        button.frame = CGRect(x: CGFloat(self.frame.size.width - 25), y: 5, width: 25, height: 25)
//        button.addTarget(self, action: #selector(self.togglePasswordView), for: .touchUpInside)
//        
//        self.rightView = button
//        self.rightViewMode = .always
//    }
    
    @objc func togglePasswordView(_ sender: Any) {
        self.isSecureTextEntry = !self.isSecureTextEntry
        setPasswordToggleImage(sender as! UIButton)
    }
}
