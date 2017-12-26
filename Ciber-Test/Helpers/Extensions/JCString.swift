//
//  JCStringExtension.swift
//  Ciber-Test
//
//  Created by johann casique on 24/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import UIKit

extension String {
    
    public var date: String? {
        let dateFormat = DateFormatter()
        dateFormat.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let date = dateFormat.date(from: self) else {
            print("no date from string")
            return nil
        }
        
        dateFormat.dateFormat = "MMMM yyyy"
        dateFormat.timeZone = TimeZone(identifier: "UTC")
        return dateFormat.string(from: date)
    }
    
    public var color: UIColor {
        return UIColor.fromHex(self)
    }
    
    public var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
    
}
