//
//  LocationLabel.swift
//  Surf_Oleinikov
//
//  Created by Yaroslav on 02.08.2023.
//

import UIKit

final class LocationLabel: UIView {
    
    
    // MARK: Public API
    
    var text: String! { didSet { locationLabel.text = text } }
    
    
    // MARK: - Properties
    
    private lazy var locationImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "location_icon"))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.sizeToFit()
        label.textColor = Colors.shared.textGrayColor
        label.font = UIFont.systemFont(ofSize: 14.0, weight: .regular)
        label.textAlignment = .left
        return label
    }()
    
    
    // MARK: - Initialize
    
    init() {
        super.init(frame: CGRect.zero)
        setupUI()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: - Setup UI
    
    private func setupUI() {
        addLocationImageView()
        addLocationLabel()
    }
    
    
    // MARK: Add location image view
    
    private func addLocationImageView() {
        locationImageView.translatesAutoresizingMaskIntoConstraints = false
        addSubview(locationImageView)
        
        locationImageView.heightAnchor.constraint(equalToConstant: 16.0).isActive = true
        locationImageView.widthAnchor.constraint(equalToConstant: 16.0).isActive = true
        locationImageView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        locationImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    
    // MARK: Add location label
    
    private func addLocationLabel() {
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        addSubview(locationLabel)
        
        locationLabel.leadingAnchor.constraint(equalTo: locationImageView.trailingAnchor, constant: 2.0).isActive = true
        locationLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        locationLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        locationLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
    }
}
