//
//  JCViewController.swift
//  Ciber-Test
//
//  Created by johann casique on 26/12/2017.
//  Copyright © 2017 johann casique. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    public func showAlert(title: String, message: String, cancelButton:Bool?=nil, completionHandler: ((Bool) -> Void)?=nil) {
        
        let alertController = UIAlertController.init(title: title, message: message, preferredStyle: .alert)
        
        let okAction = UIAlertAction.init(title: "OK", style: .default) { (_) in
            if let completion = completionHandler {
                completion(true)
            }
        }
        
        alertController.addAction(okAction)
        
        if let cancel = cancelButton {
            if cancel == true {
                let cancelAction = UIAlertAction(title: "Cancelar", style: .cancel, handler: nil)
                alertController.addAction(cancelAction)
            }
        }
        
        self.present(alertController, animated: true, completion: nil)
    }
    
}
