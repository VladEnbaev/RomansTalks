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
        static let background = UIColor.white
        static let cellsBackground = UIColor(hexString: "FCFCFC")
    }
    
    enum Images{
        enum Icons {
            static let more = UIImage(named: "moreIcon")
            static let share = UIImage(named: "shareIcon")
            enum TabBar{
                static let addPhoto = UIImage(named: "addPhotoIcon")
                static let home = UIImage(named: "homeIcon")
                static let profile = UIImage(named: "profileIcon")
            }
        }
    }
}
