//
//  JCView.swift
//  Ciber-Test
//
//  Created by johann casique on 25/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import UIKit

class JCView: UIView {
    
    public func shadow(withColor color:UIColor? = .black) {
        // Shadow and Radius
        self.layer.shadowColor = color?.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 2.5)
        self.layer.shadowOpacity = 1
        self.layer.shadowRadius = 2.0
        self.layer.masksToBounds = false
    }
    
    public func albumConfig() {
        layer.shadowColor = Styles.Colors.Black.black28.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.5)
        layer.shadowOpacity = 1
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.3
        layer.cornerRadius = 10
        layer.masksToBounds = false
    }
}

extension UIView {
   
    public func thumbnailConfig() {
        layer.shadowColor = Styles.Colors.Black.black28.cgColor
        layer.shadowOffset = CGSize(width: 0.0, height: 2.5)
        layer.shadowOpacity = 1
        layer.shadowRadius = 3.0
        layer.shadowOpacity = 0.3
        layer.cornerRadius = 10
        layer.borderColor = UIColor.lightGray.cgColor
        layer.borderWidth = 0.5
        //layer.masksToBounds = false
        
    }
}
