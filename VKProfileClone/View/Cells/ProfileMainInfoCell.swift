//
//  InfoCell.swift
//  GhibliFilms
//
//  Created by F1xTeoNtTsS on 22.02.2022.
//

import UIKit

class ProfileMainInfoCell: UITableViewCell {

    let avatarImage: UIImageView = {
        let avatar = UIImageView()
        avatar.layer.cornerRadius = Constants.avatarSize/2
        avatar.clipsToBounds = true
        //DELETE
        avatar.backgroundColor = .white
        return avatar
    }()
    
    let nameLabel: UILabel = {
        let nameLabel = UILabel()
        nameLabel.font = .boldSystemFont(ofSize: 25)
        nameLabel.text = "Вика Перова"
        nameLabel.textColor = .white
        nameLabel.textAlignment = .left
        return nameLabel
    }()
    
    let statusLabel: UILabel = {
        let statusLabel = UILabel()
        statusLabel.font = .systemFont(ofSize: 18)
        statusLabel.text = "Some cool status"
        statusLabel.textColor = .white
        statusLabel.textAlignment = .left
        return statusLabel
    }()
    
    let onlineLabel: UILabel = {
        let onlineLabel = UILabel()
        onlineLabel.font = .systemFont(ofSize: 15)
        onlineLabel.text = "Online"
        onlineLabel.textAlignment = .left
        onlineLabel.textColor = Colors.lightLabelsColor
        return onlineLabel
    }()
    
    let editButton: UIButton = {
        let editButton = UIButton(type: .system)
        editButton.setTitle("Редактировать", for: .normal)
        editButton.backgroundColor = UIColor(white: 0.2, alpha: 1)
        editButton.tintColor = .white
        editButton.layer.cornerRadius = 10
        return editButton
    }()

    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = Colors.backgroundColor
        configView()
    }

    private func configView() {
        let stack = createStack()
        self.contentView.addSubview(stack)
        
        NSLayoutConstraint.activate([
            editButton.heightAnchor.constraint(equalToConstant: Constants.editButtonHeight),
            avatarImage.widthAnchor.constraint(equalToConstant: Constants.avatarSize),
            avatarImage.heightAnchor.constraint(equalToConstant: Constants.avatarSize),
            stack.topAnchor.constraint(equalTo: self.contentView.topAnchor,
                                       constant: Constants.offsets),
            stack.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor,
                                           constant: Constants.offsets),
            stack.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor,
                                            constant: -Constants.offsets),
            stack.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor,
                                          constant: -Constants.offsets)
        ])
    }
    
    private func createStack() -> UIStackView {
        let infoStack = UIStackView(arrangedSubviews: [nameLabel, statusLabel, onlineLabel])
        infoStack.axis = .vertical
        infoStack.distribution = .fillProportionally
        
        let infoWithAvatarStack = UIStackView(arrangedSubviews: [avatarImage, infoStack])
        infoWithAvatarStack.spacing = Constants.spacing
        infoWithAvatarStack.alignment = .center
        
        let buttonsStack = createButtonsStack()
        let cellStack = UIStackView(arrangedSubviews: [infoWithAvatarStack, editButton, buttonsStack])
        cellStack.axis = .vertical
        cellStack.spacing = Constants.spacing
        cellStack.translatesAutoresizingMaskIntoConstraints = false
        return cellStack
    }
    
    private func createButtonsStack() -> UIStackView {
        let storyButton = createButton(with: "История", image: "camera")
        let noteButton = createButton(with: "Запись", image: "square.and.pencil")
        let photoButton = createButton(with: "Фото", image: "photo")
        let clipsButton = createButton(with: "Клипы", image: "iphone.badge.play")
        let buttonsStack = UIStackView(arrangedSubviews: [storyButton, noteButton, photoButton, clipsButton])
        buttonsStack.spacing = Constants.spacing
        buttonsStack.distribution = .fillEqually
        return buttonsStack
    }
    
    private func createButton(with title: String, image: String) -> UIButton {
        let button = UIButton(type: .system)
        let titleForButton = UILabel()
        titleForButton.textColor = .systemBlue
        titleForButton.text = title
        let imageForButton = UIImageView(image: UIImage(systemName: image))
        imageForButton.contentMode = .scaleAspectFit
        imageForButton.translatesAutoresizingMaskIntoConstraints = false
        imageForButton.tintColor = .systemBlue
        let stack = UIStackView(arrangedSubviews: [imageForButton, titleForButton])
        stack.axis = .vertical
        stack.spacing = 5
        stack.translatesAutoresizingMaskIntoConstraints = false
        button.addSubview(stack)
        NSLayoutConstraint.activate([
            imageForButton.heightAnchor.constraint(equalToConstant: Constants.stackButtonHeight/2),
            stack.centerXAnchor.constraint(equalTo: button.centerXAnchor),
            stack.centerYAnchor.constraint(equalTo: button.centerYAnchor),
            button.heightAnchor.constraint(equalToConstant: Constants.stackButtonHeight)
        ])
        return button
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
}

fileprivate struct Constants {
    static let avatarSize: CGFloat = 100
    static let spacing: CGFloat = 16
    static let offsets: CGFloat = 16
    static let editButtonHeight: CGFloat = 40
    static let stackButtonHeight: CGFloat = 60
}
