//
//  WeatherListView.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/21/24.
//

import UIKit

import SnapKit

final class WeatherListView: UIView {
        
    // MARK: - UI Components
    
    let tableView = UITableView(frame: .zero, style: .insetGrouped)
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
        setupCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Extensions

private extension WeatherListView {
    func setupStyle() {
        tableView.backgroundColor = .black
    }
    
    func setupHierarchy() {
        addSubview(tableView)
    }
    
    func setupLayout() {
        tableView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func setupCell() {
        tableView.register(WeatherListTableViewCell.self, 
                           forCellReuseIdentifier: WeatherListTableViewCell.className)
    }
}

