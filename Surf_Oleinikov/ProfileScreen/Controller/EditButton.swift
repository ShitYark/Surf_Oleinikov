//
//  EditButton.swift
//  Surf_Oleinikov
//
//  Created by Yaroslav on 02.08.2023.
//

import UIKit

class EditButton: UIButton {

    
    // MARK: Initialize
    
    init () {
        super.init(frame: CGRect.zero)
        setup()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    
    // MARK: Setup
    
    private func setup() {
        setImage(UIImage(named: "done_Icon"), for: .selected)
        setImage(UIImage(named: "edit_Icon"), for: .normal)
    }
}
