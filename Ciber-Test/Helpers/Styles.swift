//
//  Styles.swift
//  Ciber-Test
//
//  Created by johann casique on 25/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import UIKit

enum Styles {
    enum Fonts {
        static func JCHelveticaNeueBold(size: CGFloat? = 16) -> UIFont {
            guard let font = UIFont(name:"HelveticaNeue-Bold", size: size!) else {return UIFont.systemFont(ofSize: size!)}
            return font
        }
        static func JCHelveticaNeue(size: CGFloat? = 16) -> UIFont {
            guard let font = UIFont(name:"HelveticaNeue", size: size!) else { return UIFont.systemFont(ofSize: size!)}
            return font
        }
        
        static func JCHelveticaNeueLight(size: CGFloat? = 16) -> UIFont {
            guard let font = UIFont(name:"HelveticaNeue-Light", size: size!) else { return UIFont.systemFont(ofSize: size!)}
            return font
        }
    }
    enum Colors {
        
        enum Black {
            static let titleBlack = "252525".color
            static let black28 = UIColor(white: 0.0, alpha: 0.28)
        }
        enum Grey {
            static let subtitleGrey = "929292".color
        }
    }
}
