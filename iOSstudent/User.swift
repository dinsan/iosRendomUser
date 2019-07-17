//
//  User.swift
//  iOSstudent
//
//  Created by loord dinsan on 13/07/2019.
//  Copyright © 2019 Behan Remoshan. All rights reserved.
//

import Foundation

struct UserBase: Codable {
    let results: [RandomUser]
}

struct RandomUser: Codable{
    let gender: String
    let name: UserName
    let picture: UserPicture
    let email: String
    let location: UserLocation
    let phone: String
    let cell: String
}

struct UserName: Codable{
    let title: String
    let first: String
    let last: String
}

struct UserPicture: Codable{
    let large: String
    let medium: String
    let thumbnail: String
}

struct UserLocation: Codable {
    let street: String
    let city: String
    let state: String
}

struct UserID: Codable {
    let name: String
    let value: String
}

struct UserDob: Codable {
    let date: Date
    let age: Int
}

struct UserCoordinates: Codable {
    let latitude, longitude: String
}


struct UserTimezone: Codable {
    let offset, timezoneDescription: String
    
    enum CodingKeys: String, CodingKey {
        case offset
        case timezoneDescription = "description"
    }
}

struct UserLogin: Codable {
    let uuid, username, password, salt: String
    let md5, sha1, sha256: String
}



