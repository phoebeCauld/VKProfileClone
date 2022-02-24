//
//  MoreProfileDetailCell.swift
//  VKProfileClone
//
//  Created by F1xTeoNtTsS on 23.02.2022.
//

import UIKit

class MoreProfileDetailCell: UITableViewCell {

    let currentTownLabel: UILabel = {
        let currentTownLabel = UILabel()
        currentTownLabel.text = "Город:"
        currentTownLabel.textAlignment = .left
        currentTownLabel.font = .systemFont(ofSize: 18)
        currentTownLabel.textColor = Colors.lightLabelsColor
        return currentTownLabel
    }()
    
    let currentWorkLabel: UILabel = {
        let currentWorkLabel = UILabel()
        currentWorkLabel.text = "Место работы:"
        currentWorkLabel.textAlignment = .left
        currentWorkLabel.font = .systemFont(ofSize: 18)
        currentWorkLabel.textColor = Colors.lightLabelsColor
        return currentWorkLabel
    }()
    
    let folowersNumberLabel: UILabel = {
        let folowersNumberLabel = UILabel()
        folowersNumberLabel.text = "380 подписчиков"
        folowersNumberLabel.textAlignment = .left
        folowersNumberLabel.font = .systemFont(ofSize: 18)
        folowersNumberLabel.textColor = Colors.lightLabelsColor
        return folowersNumberLabel
    }()
    
    let moreDetailButton: UIButton = {
        let moreDetailButton = UIButton(type: .system)
        moreDetailButton.setTitle("Подробная информация", for: .normal)
        moreDetailButton.titleLabel?.font = .boldSystemFont(ofSize: 18)
        moreDetailButton.contentHorizontalAlignment = .left
        moreDetailButton.tintColor = .white
        return moreDetailButton
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.contentView.backgroundColor = Colors.backgroundColor
        configView()
    }

    private func configView() {
        let cellStack = createStackForCell()
        self.contentView.addSubview(cellStack)
        
        NSLayoutConstraint.activate([
            cellStack.topAnchor.constraint(equalTo: self.contentView.topAnchor,
                                       constant: Constants.offsets),
            cellStack.leadingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.leadingAnchor,
                                           constant: Constants.offsets),
            cellStack.trailingAnchor.constraint(equalTo: self.contentView.safeAreaLayoutGuide.trailingAnchor,
                                            constant: -Constants.offsets),
            cellStack.bottomAnchor.constraint(lessThanOrEqualTo: self.contentView.bottomAnchor,
                                          constant: -Constants.offsets)
        ])
    }
    
    private func createStackForCell() -> UIStackView {
        let townLabelStack = createStackLabelWith(image: "house", for: currentTownLabel)
        let workLabelStack = createStackLabelWith(image: "briefcase", for: currentWorkLabel)
        let folowersLabelStack = createStackLabelWith(image: "dot.radiowaves.up.forward", for: folowersNumberLabel)
        let detailButtonStack = createStackLabelWith(image: "info.circle.fill", for: moreDetailButton)
        let cellStack = UIStackView(arrangedSubviews: [townLabelStack, workLabelStack, folowersLabelStack, detailButtonStack])
        cellStack.axis = .vertical
        cellStack.spacing = Constants.spacing
        cellStack.translatesAutoresizingMaskIntoConstraints = false
        return cellStack
    }
    
    private func createStackLabelWith(image: String, for view: UIView) -> UIStackView {
        let imageForLabel = UIImageView(image: UIImage(systemName: image))
        imageForLabel.tintColor = view is UIButton ? .white : Colors.lightLabelsColor
        imageForLabel.translatesAutoresizingMaskIntoConstraints = false
        imageForLabel.contentMode = .scaleAspectFit
        imageForLabel.widthAnchor.constraint(equalToConstant: 30).isActive = true
        let stackLabel = UIStackView(arrangedSubviews: [imageForLabel, view])
        stackLabel.spacing = Constants.spacing
        return stackLabel
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
}

fileprivate struct Constants {
    static let spacing: CGFloat = 16
    static let offsets: CGFloat = 16
    static let stackButtonHeight: CGFloat = 60
}
