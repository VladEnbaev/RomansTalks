//
//  CommentModel.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 17.03.2023.
//

import Foundation

struct Comment : Codable{
    let postId : Int
    let id : Int
    let name : String
    let email : String
    let body : String
}
