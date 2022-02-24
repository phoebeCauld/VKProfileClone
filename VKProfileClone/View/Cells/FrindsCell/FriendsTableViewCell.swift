//
//  FriendsTableViewCell.swift
//  VKProfileClone
//
//  Created by F1xTeoNtTsS on 23.02.2022.
//

import UIKit

class FriendsTableViewCell: UITableViewCell {
    
    let allFriendsButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    let friendCountLabel: UILabel = {
        let friendCountLabel = UILabel()
        friendCountLabel.text = "478"
        friendCountLabel.textColor = Colors.lightLabelsColor
        friendCountLabel.font = .systemFont(ofSize: 18)
        return friendCountLabel
    }()
    
    let friendsCollectionView = FriendsCollectionViewController()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = Colors.backgroundColor
        configView()
    }
    
    private func configView() {
        configFriensButton()
        friendsCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        allFriendsButton.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(friendsCollectionView.view)
        self.contentView.addSubview(allFriendsButton)

        NSLayoutConstraint.activate([
            allFriendsButton.topAnchor.constraint(equalTo: self.contentView.topAnchor,
                                       constant: Constants.offsets),
            allFriendsButton.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor,
                                           constant: Constants.offsets),
            allFriendsButton.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor,
                                            constant: -Constants.offsets),
            friendsCollectionView.view.topAnchor.constraint(equalTo: allFriendsButton.bottomAnchor,
                                                            constant: Constants.offsets),
            friendsCollectionView.view.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor,
                                           constant: Constants.offsets),
            friendsCollectionView.view.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor,
                                            constant: -Constants.offsets),
            friendsCollectionView.view.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor,
                                                               constant: -Constants.offsets),
            friendsCollectionView.view.heightAnchor.constraint(equalToConstant: 150)
        ])
    }
    
    private func configFriensButton() {
        let friendsLabel = UILabel()
        friendsLabel.text = "друзья"
        friendsLabel.font = .systemFont(ofSize: 19)
        friendsLabel.textColor = .white
        let navImage = UIImageView(image: UIImage(systemName: "chevron.right"))
        navImage.tintColor = Colors.lightLabelsColor
        let stackForButton = UIStackView(arrangedSubviews: [friendsLabel,
                                                            friendCountLabel,
                                                            UIView(),
                                                            navImage])
        stackForButton.spacing = Constants.spacing
        stackForButton.translatesAutoresizingMaskIntoConstraints = false
        allFriendsButton.addSubview(stackForButton)
        NSLayoutConstraint.activate([
            stackForButton.topAnchor.constraint(equalTo: allFriendsButton.topAnchor),
            stackForButton.leadingAnchor.constraint(equalTo: allFriendsButton.leadingAnchor),
            stackForButton.trailingAnchor.constraint(equalTo: allFriendsButton.trailingAnchor),
            stackForButton.bottomAnchor.constraint(equalTo: allFriendsButton.bottomAnchor),

            allFriendsButton.heightAnchor.constraint(equalToConstant: Constants.stackButtonHeight)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
}

fileprivate struct Constants {
    static let spacing: CGFloat = 16
    static let offsets: CGFloat = 16
    static let stackButtonHeight: CGFloat = 20
}
