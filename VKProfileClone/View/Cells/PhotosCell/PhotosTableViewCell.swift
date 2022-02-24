//
//  PhotosTableViewCell.swift
//  VKProfileClone
//
//  Created by F1xTeoNtTsS on 23.02.2022.
//

import UIKit

class PhotosTableViewCell: UITableViewCell {
    
    let allPhotosButton: UIButton = {
        let button = UIButton(type: .system)
        return button
    }()
    
    let photosCountLabel: UILabel = {
        let photosCountLabel = UILabel()
        photosCountLabel.text = "321"
        photosCountLabel.textColor = Colors.lightLabelsColor
        photosCountLabel.font = .systemFont(ofSize: 18)
        return photosCountLabel
    }()
    
    let photosCollectionView = PhotosCollectionViewController()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = Colors.backgroundColor
        configView()
    }
    
    private func configView() {
        configFriensButton()
        photosCollectionView.view.translatesAutoresizingMaskIntoConstraints = false
        allPhotosButton.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(photosCollectionView.view)
        self.contentView.addSubview(allPhotosButton)

        NSLayoutConstraint.activate([
            allPhotosButton.topAnchor.constraint(equalTo: self.contentView.topAnchor,
                                       constant: Constants.offsets),
            allPhotosButton.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor,
                                           constant: Constants.offsets),
            allPhotosButton.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor,
                                            constant: -Constants.offsets),
            photosCollectionView.view.topAnchor.constraint(equalTo: allPhotosButton.bottomAnchor,
                                                            constant: Constants.offsets),
            photosCollectionView.view.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor,
                                           constant: Constants.offsets),
            photosCollectionView.view.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor,
                                            constant: -Constants.offsets),
            photosCollectionView.view.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor,
                                                               constant: -Constants.offsets),
            photosCollectionView.view.heightAnchor.constraint(equalToConstant: Constants.photosCollectionHeight)
        ])
    }
    
    private func configFriensButton() {
        let photosLabel = UILabel()
        photosLabel.text = "фотографии"
        photosLabel.font = .systemFont(ofSize: 19)
        photosLabel.textColor = .white
        let navImage = UIImageView(image: UIImage(systemName: "chevron.right"))
        navImage.tintColor = Colors.lightLabelsColor
        let stackForButton = UIStackView(arrangedSubviews: [photosLabel,
                                                            photosCountLabel,
                                                            UIView(),
                                                            navImage])
        stackForButton.spacing = Constants.spacing
        stackForButton.translatesAutoresizingMaskIntoConstraints = false
        allPhotosButton.addSubview(stackForButton)
        NSLayoutConstraint.activate([
            stackForButton.topAnchor.constraint(equalTo: allPhotosButton.topAnchor),
            stackForButton.leadingAnchor.constraint(equalTo: allPhotosButton.leadingAnchor),
            stackForButton.trailingAnchor.constraint(equalTo: allPhotosButton.trailingAnchor),
            stackForButton.bottomAnchor.constraint(equalTo: allPhotosButton.bottomAnchor),

            allPhotosButton.heightAnchor.constraint(equalToConstant: Constants.stackButtonHeight)
        ])
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

fileprivate struct Constants {
    static let spacing: CGFloat = 16
    static let offsets: CGFloat = 16
    static let stackButtonHeight: CGFloat = 20
    static let photosCollectionHeight: CGFloat = (UIScreen.main.bounds.width/3)*2
}

