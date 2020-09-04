//
//  CityMainViewController.swift
//  City helper
//
//  Created by Alan on 01.09.2020.
//  Copyright © 2020 Alan Temirov. All rights reserved.
//

import UIKit

class CityMainViewController: UIViewController, CityMainViewProtocol {
    
    @IBOutlet private(set) var tableView: UITableView!
    
    var presenter: CityMainPresenterProtocol!
    var dataProvider: CityMainDataProvider!
    
    var onCitySelected: ItemClosure<CityModel>?
    
    weak var controller: UIViewController! { self }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureTableView()
        presenter.onAppear()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
        dataProvider.onCitySelected = onCitySelected
    }
    
}

extension CityMainViewController: RateUpdateble {
    
    func updateCity(cityName: String, isRated: Bool) {
        presenter.updateCityModel(cityName: cityName, isRated: isRated)
    }
    
}

// MARK: - Private
private extension CityMainViewController {
    
    func configureTableView() {
        tableView.delegate = dataProvider
        tableView.dataSource = dataProvider
        
        tableView.register(CityMainTableViewCell.nib, forCellReuseIdentifier: CityMainTableViewCell.identifier)
    }
    
}
