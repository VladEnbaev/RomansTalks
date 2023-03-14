//
//  PostModel.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 14.03.2023.
//

import Foundation

struct Post: Codable {
    var userId : Int
    var id : Int
    var title : String
    var body: String
}
