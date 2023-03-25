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
        static let usernameEmpty = "username and/or password is empty"
        static let needToRegistration = "failed to find such user. you may not have registered yet"
    }
}