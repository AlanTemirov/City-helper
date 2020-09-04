//
//  UIAlertController+Extension.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

extension UIAlertController {
    
    static func showAlert(
        withTitle title: String,
        message : String? = nil,
        confirmClosure: VoidClosure? = nil,
        cancelClosure: VoidClosure? = nil
    ) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let confirmAction = UIAlertAction(title: "OK", style: .default) { _ in
            confirmClosure?()
        }
        alertController.addAction(confirmAction)
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { _ in
            cancelClosure?()
        }
        alertController.addAction(cancelAction)
        
        let topViewController = UIApplication.shared.windows.filter { $0.isKeyWindow }.first?.rootViewController
        topViewController?.present(alertController, animated: true, completion: nil)
    }
    
}
