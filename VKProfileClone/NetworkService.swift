//
//  NetworkService.swift
//  GhibliFilms
//
//  Created by F1xTeoNtTsS on 21.02.2022.
//

import Foundation

protocol NetworkServiceProtocol {
    func fetchFriendsListData(completion: @escaping (Result<FriendsModel, Error>) -> Void)
    func fetchCurrentUserData(completion: @escaping (Result<UserMoodel, Error>) -> Void) 
}

class NetworkService: NetworkServiceProtocol {
    
    func fetchGenericData<T: Decodable>(urlString: String, completion: @escaping (Result<T, Error>) -> Void) {
        let urlString = urlString
        guard let url = URL(string: urlString) else { return }
        URLSession.shared.dataTask(with: url) { data, _, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            if let data = data {
                do {
                    let decodedData = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
    
    func fetchFriendsListData(completion: @escaping (Result<FriendsModel, Error>) -> Void) {
        let urlString = "https://api.vk.com/method/friends.get?v=5.131&access_token=9ca316a88d46b9e5e8866b5271f989f1525cfc4f73b1312f92a2ca23a89d798dceb6f8a82194a3c606cd8"
        fetchGenericData(urlString: urlString, completion: completion)
    }
    
    func fetchCurrentUserData(completion: @escaping (Result<UserMoodel, Error>) -> Void) {
        let urlString = "https://api.vk.com/method/account.getProfileInfo?v=5.131&access_token=9ca316a88d46b9e5e8866b5271f989f1525cfc4f73b1312f92a2ca23a89d798dceb6f8a82194a3c606cd8"
        fetchGenericData(urlString: urlString, completion: completion)
    }
}

