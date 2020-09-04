//
//  CityMainTableViewCell.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class CityMainTableViewCell: UITableViewCell, NibLoadableProtocol {
    
    @IBOutlet private var nameLabel: UILabel!
    @IBOutlet private var locationLabel: UILabel!
    @IBOutlet private var starImage: UIImageView!
    
    func configure(with cityModel: CityModel) {
        nameLabel.text = cityModel.name
        locationLabel.text = """
        Lat: \(
        cityModel.location?.coordinate?.lat.description ?? ""
        ), Lon: \(
        cityModel.location?.coordinate?.lng.description ?? ""
        )
        """
        
        starImage.isHidden = !cityModel.isRated
    }
    
}
