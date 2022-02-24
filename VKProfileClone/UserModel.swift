//
//  UserModel.swift
//  GhibliFilms
//
//  Created by F1xTeoNtTsS on 21.02.2022.
//

import Foundation

struct UserMoodel: Decodable {
    let response: UserResponse
}

struct UserResponse: Decodable {
    let id: Int
    let homeTown: String?
    let firstName, lastName: String
    let relation: Int
    let relationPartner: RelationPartner
    let city: City
    let country: Country
    
    enum CodingKeys: String, CodingKey {
        case homeTown = "home_town"
        case firstName = "first_name"
        case lastName = "last_name"
        case relationPartner = "relation_partner"
        case id, relation, city, country
    }
}

struct RelationPartner: Decodable {
    let id: Int
    let firstName, lastName: String
    
    enum CodingKeys: String, CodingKey {
        case firstName = "first_name"
        case lastName = "last_name"
        case id
    }
}

struct City: Decodable {
    let title: String?
}

struct Country: Decodable {
    let title: String?
}

struct CurrentUser {
    let id: Int
    let firstName, lastName: String
    let homeTown: String?
    let city: City
    let country: Country
    let relation: Int
    let partnerName, partnerLastName: String?
}
