//
//  SkillCell.swift
//  Surf_Oleinikov
//
//  Created by Yaroslav on 01.08.2023.
//

import UIKit

enum State {
    case normal
    case delete
}

class SkillCell: UICollectionViewCell {
    
    
    // MARK: Public API
    
    static let reuseIdentifier: String = "skillCell"
    var state: State = .normal { didSet { modifyState() } }
    var text: String = "" { didSet { titleLabel.text = text } }
    var deleteClosure: (() -> Void)?

    
    // MARK: Params
    
    private let screenWidth: CGFloat = UIScreen.main.bounds.width
    private var deleteImageSide: CGFloat = 14.0
    
    
    // MARK: - Properties
        
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.font = UIFont.systemFont(ofSize: 14.0)
        label.textColor = Colors.shared.darkColor
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .center
        return label
    }()

    private lazy var deleteButton: UIButton = {
       let button = UIButton()
        button.setImage(UIImage(named: "delete_Icon"), for: .normal)
        button.isHidden = true
        button.addTarget(self, action: #selector(deleteCell), for: .touchUpInside)
        return button
    }()
    
    
    // MARK: Constraints
    
    var titleLabel_trailing: NSLayoutConstraint?
    var titleLabel_width: NSLayoutConstraint?
    
    
    // MARK: - Initialize
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = UIColor(red: 243/255, green: 243/255, blue: 245/255, alpha: 1)
        contentView.layer.cornerRadius = 12
        setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Setup
    
    private func setup(){
        addTitleLabel()
        addDeleteButton()
    }
    
    
    // MARK: Add Title label
    
    private func addTitleLabel() {
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24.0).isActive = true
        titleLabel_trailing = titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24.0)
        titleLabel_trailing?.isActive = true
        titleLabel_width = titleLabel.widthAnchor.constraint(lessThanOrEqualToConstant: screenWidth - 80)
        titleLabel_width?.isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12.0).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12.0).isActive = true
    }
    
    
    // MARK: Add delete button
    
    private func addDeleteButton() {
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        addSubview(deleteButton)
        
        deleteButton.heightAnchor.constraint(equalToConstant: deleteImageSide).isActive = true
        deleteButton.widthAnchor.constraint(equalToConstant: deleteImageSide).isActive = true
        deleteButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        deleteButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24.0).isActive = true
    }
    
    
    // MARK: Functions
    
    private func modifyState() {
        if state == .normal {
            deleteButton.isHidden = true
            titleLabel_trailing?.constant = -24.0
            titleLabel_width?.constant = screenWidth - 80
        } else {
            deleteButton.isHidden = false
            titleLabel_trailing?.constant = -(34 + deleteImageSide)
            titleLabel_width?.constant = screenWidth - (90 + deleteImageSide)
        }
        layoutIfNeeded()
    }
    
    @objc private func deleteCell() {
        deleteClosure?()
    }
}
