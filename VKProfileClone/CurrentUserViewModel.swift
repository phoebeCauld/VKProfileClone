//
//  AllFilmsViewModel.swift
//  GhibliFilms
//
//  Created by F1xTeoNtTsS on 21.02.2022.
//

protocol ViewModelProtocol {
    init(networkService: NetworkServiceProtocol?, router: RouterProtocol)
    func showMoreDetail()
}


class CurrentUserViewModel: ViewModelProtocol {
    
    private var networkService: NetworkServiceProtocol?
    var router: RouterProtocol?
    var updateViewData: (() -> Void)?
    
    required init(networkService: NetworkServiceProtocol?, router: RouterProtocol) {
        self.networkService = networkService
        self.router = router
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
    
    func showMoreDetail() {
        guard let router = router else { return }
        router.showProfileVC()
    }
}
