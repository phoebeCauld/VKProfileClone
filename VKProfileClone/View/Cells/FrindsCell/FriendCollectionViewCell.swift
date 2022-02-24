//
//  FriendCollectionViewCell.swift
//  VKProfileClone
//
//  Created by F1xTeoNtTsS on 23.02.2022.
//

import UIKit

class FriendCollectionViewCell: UICollectionViewCell {
    
    let avatarImage: UIImageView = {
        let avatarImage = UIImageView()
        avatarImage.layer.cornerRadius = Constants.avatarSize/2
        avatarImage.clipsToBounds = true
        //DELETE
        avatarImage.backgroundColor = .white
        return avatarImage
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .systemFont(ofSize: 18)
        nameLabel.text = "Дима Абанин"
        nameLabel.numberOfLines = 2
        nameLabel.textColor = .white
        nameLabel.textAlignment = .center
        return nameLabel
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = Colors.backgroundColor
        configView()
    }
    
    private func configView() {
        let friendStack = createFriendStack()
        self.contentView.addSubview(friendStack)
        NSLayoutConstraint.activate([
            avatarImage.heightAnchor.constraint(equalToConstant: Constants.avatarSize),
            friendStack.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            friendStack.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            friendStack.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            friendStack.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor)
        ])
    }
    
    private func createFriendStack() -> UIStackView {
        let friendsStack = UIStackView(arrangedSubviews: [avatarImage, nameLabel])
        friendsStack.axis = .vertical
        friendsStack.distribution = .fillProportionally
        friendsStack.spacing = Constants.spacing
        friendsStack.translatesAutoresizingMaskIntoConstraints = false
        return friendsStack
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

fileprivate struct Constants {
    static let avatarSize: CGFloat = 75
    static let spacing: CGFloat = 16
    static let offsets: CGFloat = 16
    static let editButtonHeight: CGFloat = 40
    static let stackButtonHeight: CGFloat = 60
}
