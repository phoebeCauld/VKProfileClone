//
//  Builder.swift
//  VKProfileClone
//
//  Created by F1xTeoNtTsS on 27.02.2022.
//

import Foundation
import UIKit

protocol Builder {
    func createProfileVC(router: RouterProtocol) -> UIViewController
}


struct MainBuilder: Builder {
    
    func createProfileVC(router: RouterProtocol) -> UIViewController {
        let profileVC = ProfileViewController()
        let networkService = NetworkService()
        profileVC.profileViewModel = CurrentUserViewModel(networkService: networkService, router: router)
        return profileVC
    }
}
