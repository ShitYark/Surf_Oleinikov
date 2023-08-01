//
//  ProfileView.swift
//  Surf_Oleinikov
//
//  Created by Yaroslav on 02.08.2023.
//

import UIKit

class ProfileView: UIView {
    
    
    // MARK: Params
    
    private let profImageSide: CGFloat = 120.0
    
    
    // MARK: - Properties
    
    private lazy var profileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "profileImage"))
        imageView.layer.cornerRadius = profImageSide/2
        imageView.clipsToBounds = true
        return imageView
    }()
    
    private lazy var profileNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.shared.darkColor
        label.font = UIFont.systemFont(ofSize: 24.0, weight: .bold)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    
    private lazy var profileInfoLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.shared.textGrayColor
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        label.textAlignment = .center
        label.numberOfLines = 2
        label.sizeToFit()
        return label
    }()
    
    private lazy var locationLabel: LocationLabel = {
        let label = LocationLabel()
        return label
    }()
    
    
    // MARK: - Initialize
    
    init(name: String,
         info:String,
         location:String) {
        
        super.init(frame: CGRect.zero)
        setupUI(name: name,
                info:info,
                location:location)
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Setup UI
    
    private func setupUI(name: String,
                         info: String,
                         location: String) {
        backgroundColor = Colors.shared.grayColor
        addProfileImage()
        addProfileNameLabel(name: name)
        addProfileInfoLabel(info: info)
        addLocationLabel(location: location)
    }
    
    
    // MARK: Add profile image
    
    private func addProfileImage() {
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileImageView)
        
        profileImageView.heightAnchor.constraint(equalToConstant: profImageSide).isActive = true
        profileImageView.widthAnchor.constraint(equalToConstant: profImageSide).isActive = true
        profileImageView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileImageView.topAnchor.constraint(equalTo: topAnchor, constant: 24.0).isActive = true
    }
    
    
    // MARK: Add profile name
    
    private func addProfileNameLabel(name: String) {
        profileNameLabel.text = name
        profileNameLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileNameLabel)
        
        profileNameLabel.heightAnchor.constraint(equalToConstant: 64.0).isActive = true
        profileNameLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileNameLabel.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 16.0).isActive = true
    }
    
    
    // MARK: Add profile info
    
    private func addProfileInfoLabel(info: String) {
        profileInfoLabel.text = info
        profileInfoLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(profileInfoLabel)
        
        profileInfoLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        profileInfoLabel.topAnchor.constraint(equalTo: profileNameLabel.bottomAnchor, constant: 4.0).isActive = true
    }
    
    // MARK: Add profile location
    
    private func addLocationLabel(location: String) {
        locationLabel.text = location
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(locationLabel)
        
        locationLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        locationLabel.topAnchor.constraint(equalTo: profileInfoLabel.bottomAnchor).isActive = true
        locationLabel.heightAnchor.constraint(equalToConstant: 20.0).isActive = true
        locationLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -20.0).isActive = true
    }
    
}
