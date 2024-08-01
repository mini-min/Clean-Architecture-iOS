//
//  DetailWeatherViewController.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/31/24.
//

import UIKit

import SnapKit

final class DetailWeatherViewController: UIViewController {
    
    // MARK: - Properties
    
    // MARK: - UI Properties
    
    private let detailWeatherView = DetailWeatherView()
    
    // MARK: - Life Cycle
    
    override func loadView() {
        self.view = detailWeatherView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupDelegate()
    }
    
}

// MARK: - Networks

extension DetailWeatherViewController {
    func fetchMain() {
        
    }
}

// MARK: - Private Extensions

private extension DetailWeatherViewController {
    
    func setupDelegate() {
        
    }
    
}

