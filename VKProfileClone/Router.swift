//
//  Router.swift
//  VKProfileClone
//
//  Created by F1xTeoNtTsS on 27.02.2022.
//

import Foundation
import UIKit

protocol MainRouter {
    var navigationController: UINavigationController? {get set}
    var builder: Builder? {get set}
}

protocol RouterProtocol: MainRouter {
    func showProfileVC()
    func popToRoot()
}

struct Router: RouterProtocol {

    var navigationController: UINavigationController?
    
    var builder: Builder?
    
    func showProfileVC() {
        guard let navigationController = navigationController else { return }
        guard let profileVC = builder?.createProfileVC(router: self) else { return }
        navigationController.viewControllers = [profileVC]
    }
    
    func popToRoot() {
        guard let navigationController = navigationController else { return }
        navigationController.popToRootViewController(animated: true)
    }
    

    
}

