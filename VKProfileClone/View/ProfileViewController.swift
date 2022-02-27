//
//  ViewController.swift
//  GhibliFilms
//
//  Created by F1xTeoNtTsS on 20.02.2022.
//

import UIKit

fileprivate enum CellType: Int {
    case info
    case moreDetail
    case friends
    case photos
}

class ProfileViewController: UITableViewController {
    private var cellId = "cell"
    private var detailCellId = "detailCellId"
    private var friendsCellId = "friendsCellId"
    private var photosCellId = "photosCellId"
    var profileViewModel: ViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.backgroundColor = Colors.backgroundColor
        configTableViewCells()
    }
    
    private func configTableViewCells() {
        tableView.register(ProfileMainInfoCell.self, forCellReuseIdentifier: cellId)
        tableView.register(MoreProfileDetailCell.self, forCellReuseIdentifier: detailCellId)
        tableView.register(FriendsTableViewCell.self, forCellReuseIdentifier: friendsCellId)
        tableView.register(PhotosTableViewCell.self, forCellReuseIdentifier: photosCellId)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    
    @objc func showMoreDetail() {
        //profileViewModel?.showMoreDetail()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case CellType.info.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? ProfileMainInfoCell else { return UITableViewCell() }
            return cell
        case CellType.moreDetail.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: detailCellId, for: indexPath) as? MoreProfileDetailCell else { return UITableViewCell() }
            return cell
        case CellType.friends.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: friendsCellId, for: indexPath) as? FriendsTableViewCell else { return UITableViewCell() }
            return cell
        case CellType.photos.rawValue:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: photosCellId, for: indexPath) as? PhotosTableViewCell else { return UITableViewCell() }
            return cell
        default:
            return UITableViewCell()
        }
    }
}


