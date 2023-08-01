//
//  Colors.swift
//  Surf_Oleinikov
//
//  Created by Yaroslav on 02.08.2023.
//

import Foundation
import UIKit

final class Colors: NSObject {
    
    static let shared = Colors()
    private override init() {}
    
    let textGrayColor: UIColor = UIColor(red: 150/255, green: 149/255, blue: 155/255, alpha: 1)
    let grayColor: UIColor = UIColor(red: 243/255, green: 243/255, blue: 245/255, alpha: 1)
    let darkColor: UIColor = UIColor(red: 49/255, green: 49/255, blue: 49/255, alpha: 1)
}
