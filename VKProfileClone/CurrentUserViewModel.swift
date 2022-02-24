//
//  AllFilmsViewModel.swift
//  GhibliFilms
//
//  Created by F1xTeoNtTsS on 21.02.2022.
//

protocol ViewModelProtocol {
    init(networkService: NetworkServiceProtocol?)
}


class CurrentUserViewModel: ViewModelProtocol {
    
    private var networkService: NetworkServiceProtocol?
    var updateViewData: (() -> Void)?
    
    required init(networkService: NetworkServiceProtocol?) {
        self.networkService = networkService
    }
    
    func fetchData() {
        guard let networkService = networkService else { return }

        networkService.fetchCurrentUserData { result in
            switch result {
            case .success(let user):
                print(user.response.firstName)
            case .failure(let error):
                print(error)
                return
            }
        }
        networkService.fetchFriendsListData { result in
            switch result {
            case .success(let user):
                print(user.response.items)
            case .failure(let error):
                print(error)
                return
            }
        }
    }
}
