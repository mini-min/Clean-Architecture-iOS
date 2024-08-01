//
//  DetailWeatherToolBarView.swift
//  iOS-Clone-Project
//
//  Created by 민 on 8/1/24.
//

import UIKit

import SnapKit

final class DetailWeatherToolBarView: UIView {
        
    // MARK: - UI Components
    
    private let mapButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "map"), for: .normal)
        button.tintColor = .white
        return button
    }()
    
    private let listButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "list.bullet"), for: .normal)
        button.tintColor = .white
        return button
    }()

    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        pageControl.setIndicatorImage(UIImage(systemName: "location.fill"), forPage: 0)
        return pageControl
    }()
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyle()
        setupHierarchy()
        setupLayout()
        setupAddTarget()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Private Extensions

private extension DetailWeatherToolBarView {
    func setupStyle() {
        backgroundColor = .gray
    }
    
    func setupHierarchy() {
        addSubviews(mapButton, pageControl, listButton)
    }
    
    func setupLayout() {
        mapButton.snp.makeConstraints {
            $0.size.equalTo(44)
            $0.top.equalToSuperview().inset(4)
            $0.leading.equalToSuperview().inset(10)
        }
        listButton.snp.makeConstraints {
            $0.size.equalTo(44)
            $0.top.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(10)
        }
        pageControl.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalTo(listButton.snp.centerY)
        }
    }
    
    func setupAddTarget() {
        mapButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        listButton.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        pageControl.addTarget(self, action: #selector(segmentedControlValueChanged), for: .valueChanged)
    }
    
    @objc
    func buttonTapped(_ sender: UIButton) {
        switch sender {
        case mapButton:
            print("mapButton Tapped!")
        case listButton:
            print("listButton Tapped!")
        default:
            break
        }
    }
    
    @objc
    func segmentedControlValueChanged(_ sender: UIPageControl) {
        print("changed!")
    }
}

