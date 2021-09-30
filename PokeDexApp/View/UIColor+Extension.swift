//
//  UIColor+Extension.swift
//  PokeDexApp
//
//  Created by Михаил on 21.09.2021.
//

import Foundation
import UIKit

extension UIColor {
    
    static func rgb(red: CGFloat, green: CGFloat, blue: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: 1)
    }
    
    static func mainPink() -> UIColor {
        return UIColor.rgb(red: 210, green: 113, blue: 113)

    }
    
    static func elephantBone() -> UIColor {
        return UIColor.rgb(red: 255, green: 250, blue: 232)
    }
    
    static func elephantBoneDark() -> UIColor {
        return UIColor.rgb(red: 240, green: 240, blue: 210)
    }
    
}
