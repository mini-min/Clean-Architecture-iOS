//
//  DetailWeatherView.swift
//  iOS-Clone-Project
//
//  Created by 민 on 8/1/24.
//

import UIKit

import SnapKit

final class DetailWeatherView: UIView {
    
    // MARK: - Properties
    
    // MARK: - UI Components
    
    private let toolBarView = DetailWeatherToolBarView()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
        setupAddTarget()
        setupCell()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Extensions

extension DetailWeatherView {
    func setupDataBind() {
        
    }
}

// MARK: - Private Extensions

private extension DetailWeatherView {
    func setupStyle() {
        backgroundColor = .white
    }
    
    func setupHierarchy() {
        addSubviews(toolBarView)
    }
    
    func setupLayout() {
        toolBarView.snp.makeConstraints {
            $0.leading.trailing.bottom.equalToSuperview()
            $0.height.equalTo(82)
        }
    }
    
    func setupCell() {
        
    }
    
    func setupAddTarget() {
        
    }
    
    @objc
    func buttonTapped() {
        
    }
}

