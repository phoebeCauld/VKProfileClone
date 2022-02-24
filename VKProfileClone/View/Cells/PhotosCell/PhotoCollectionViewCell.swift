//
//  PhotoCollectionViewCell.swift
//  VKProfileClone
//
//  Created by F1xTeoNtTsS on 23.02.2022.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {
    
    let photo: UIImageView = {
        let photo = UIImageView()
        photo.layer.cornerRadius = 10
        photo.clipsToBounds = true
        photo.contentMode = .scaleAspectFill
        photo.translatesAutoresizingMaskIntoConstraints = false
        photo.backgroundColor = .white
        return photo
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.contentView.backgroundColor = Colors.backgroundColor
        configCell()
    }
    
    private func configCell() {
        self.contentView.addSubview(photo)
        NSLayoutConstraint.activate([
            photo.topAnchor.constraint(equalTo: self.contentView.topAnchor),
            photo.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor),
            photo.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor),
            photo.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
