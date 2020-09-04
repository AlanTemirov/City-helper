//
//  CityRateViewController.swift
//  City helper
//
//  Created by Alan on 02.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class CityRateViewController: UIViewController {

    @IBOutlet private var rateInfoLabel: UILabel!
    
    var cityModelName: String!
    var onRateAction: ItemsClosure<String, Bool>?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        UIAlertController.showAlert(
            withTitle: "Are you sure to rate this city?",
            confirmClosure: { [unowned self] in
                self.rateInfoLabel.text = "City \(self.cityModelName ?? "") is now rated"
                self.onRateAction?(self.cityModelName, true)
            }, cancelClosure: { [unowned self] in
                self.onRateAction?(self.cityModelName, false)
            }
        )
    }

}
