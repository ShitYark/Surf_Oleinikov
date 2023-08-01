//
//  NavigationController.swift
//  Surf_Oleinikov
//
//  Created by Yaroslav on 02.08.2023.
//

import UIKit

class NavigationController: UINavigationController {

    
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColor()
    }
    

   // MARK: Set color
    
    private func setColor() {
        let appearance = UINavigationBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = Colors.shared.grayColor
        appearance.shadowImage = nil
        appearance.backgroundImage = nil
        appearance.shadowColor = .clear

        navigationBar.standardAppearance = appearance
        navigationBar.scrollEdgeAppearance = appearance
    }
}
