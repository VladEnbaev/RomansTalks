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
    
    var lat: String
    var lng: String
    
    init(lat: String, lng: String) {
        self.lat = lat
        self.lng = lng
    }
    
    init() {
        self.lat = ""
        self.lng = ""
    }
}

struct Address : Codable {
    
    let street: String
    let suite: String
    let city : String
    let zipcode : String
    let geo : Geo
    
    init(street: String, suite: String, city: String, zipcode: String, geo: Geo) {
        self.street = street
        self.suite = suite
        self.city = city
        self.zipcode = zipcode
        self.geo = geo
    }
    
    init() {
        self.street = ""
        self.suite = ""
        self.city = ""
        self.zipcode = ""
        self.geo = Geo()
    }
}

struct Company : Codable {
    static let adminCompany = Company(name: "", catchPrase: "", bs: "")
    let name : String
    let catchPrase : String
    let bs : String
    
    init(name: String, catchPrase: String, bs: String) {
        self.name = name
        self.catchPrase = catchPrase
        self.bs = bs
    }
    init() {
        self.name = ""
        self.catchPrase = ""
        self.bs = ""
    }
}

struct User : Codable {
    
    static let admin = User(id: 101, name: "vlad", username: "gradskiy", email: "", address: Address(), phone: "89829219421", website: "gradskiy.com", company: Company())
    
    let id : Int
    let name : String
    let username : String
    let email : String
    let address : Address
    let phone : String
    let website : String
    let company : Company
    
    init(id: Int, name: String, username: String, email: String, address: Address, phone: String, website: String, company: Company) {
        self.id = id
        self.name = name
        self.username = username
        self.email = email
        self.address = address
        self.phone = phone
        self.website = website
        self.company = company
    }
    
    init() {
        self.id = 0
        self.name = ""
        self.username = ""
        self.email = ""
        self.address = Address()
        self.phone = ""
        self.website = ""
        self.company = Company()
    }
    
    
}
