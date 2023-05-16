//
//  Resources.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 18.03.2023.
//

import Foundation
import UIKit

enum Resources {
    enum Identifiers {
        static let postCellID = "PostCellReuseIdentifier"
        static let detailPostCellID = "DetailPostCellReuseIdentifier"
        static let commentCellID = "CommentCellReuseIdentifier"
    }
    enum ErrorTexts {
        static let usernameEmpty = "username is empty"
        static let passwordEmpty = "password is empty"
        static let needToRegistration = "failed to find such user. you may not have registered yet"
        static let emailEmpty = "email is empty"
    }
    
    enum Colors {
        static let orange = UIColor(hexString: "FA9884")
        static let darkGrey = UIColor(hexString: "575353")
        static let lightGrey = UIColor(hexString: "706C6C")
        static let unselected = UIColor(hexString: "9E9898")
    }
}
