//
//  UserModel.swift
//  NetwokingMVP
//
//  Created by Влад Енбаев on 19.03.2023.
//

import Foundation

//{
//    "id": 1,
//    "name": "Leanne Graham",
//    "username": "Bret",
//    "email": "Sincere@april.biz",
//    "address": {
//      "street": "Kulas Light",
//      "suite": "Apt. 556",
//      "city": "Gwenborough",
//      "zipcode": "92998-3874",
//      "geo": {
//        "lat": "-37.3159",
//        "lng": "81.1496"
//      }
//    },
//    "phone": "1-770-736-8031 x56442",
//    "website": "hildegard.org",
//    "company": {
//      "name": "Romaguera-Crona",
//      "catchPhrase": "Multi-layered client-server neural-net",
//      "bs": "harness real-time e-markets"
//    }

struct Geo: Codable {
    static let adminGeo = Geo(lat: "", lng: "")
    var lat: String
    var lng: String
}

struct Address : Codable {
    static let adminAdress = Address(street: "", suite: "", city: "", zipcode: "", geo: Geo.adminGeo)
    let street: String
    let suite: String
    let city : String
    let zipcode : String
    let geo : Geo
}

struct Company : Codable {
    static let adminCompany = Company(name: "", catchPrase: "", bs: "")
    let name : String
    let catchPrase : String
    let bs : String
}

struct User : Codable {
    
    static let admin = User(id: 101, name: "vlad", username: "gradskiy", email: "", address: Address.adminAdress, phone: "89829219421", website: "gradskiy.com", company: Company.adminCompany)
    
    let id : Int
    let name : String
    let username : String
    let email : String
    let address : Address
    let phone : String
    let website : String
    let company : Company
}
