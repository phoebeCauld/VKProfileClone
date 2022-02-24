//
//  Model.swift
//  GhibliFilms
//
//  Created by F1xTeoNtTsS on 21.02.2022.
//

import Foundation

struct FriendsModel: Decodable {
    let response: Response
}
struct Response: Decodable {
    let items: [Int]
}



