//
//  WeatherListTableViewCell.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/21/24.
//

import UIKit

import SnapKit

final class WeatherListTableViewCell: UITableViewCell {
        
    // MARK: - UI Components
    
    private let weatherImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "cloud_background")
        return imageView
    }()
    
    private let locationLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 24, weight: .bold)
        return label
    }()
    
    private let timeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 17, weight: .medium)
        return label
    }()

    private let weatherLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 16, weight: .semibold)
        return label
    }()
    
    private let tempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 52, weight: .semibold)
        return label
    }()
    
    private let maxMinTempLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.font = .systemFont(ofSize: 15, weight: .medium)
        return label
    }()
    
    // MARK: - Life Cycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupStyle()
        setupHierarchy()
        setupLayout()
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0))
    }
}

// MARK: - Extensions

extension WeatherListTableViewCell {
    func bindData(data: WeatherListModel, row: Int) {
        self.locationLabel.text = data.location
        self.timeLabel.text = makeTimeZoneToTime(timeZone: data.time)
        self.weatherLabel.text = data.weather
        self.tempLabel.text = "\(data.temp)˚"
        self.maxMinTempLabel.text = "H:\(data.maxTemp)˚ L:\(data.minTemp)˚"
    }
}

// MARK: - Private Extensions

private extension WeatherListTableViewCell {
    func setupStyle() {
        contentView.backgroundColor = .black
        backgroundColor = .black
    }
    
    func setupHierarchy() {
        contentView.addSubview(weatherImageView)
        weatherImageView.addSubviews(locationLabel,
                                     timeLabel,
                                     weatherLabel,
                                     tempLabel,
                                     maxMinTempLabel)
    }
    
    func setupLayout() {
        weatherImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        locationLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.leading.equalToSuperview().inset(16)
        }
        timeLabel.snp.makeConstraints {
            $0.top.equalTo(locationLabel.snp.bottom).offset(2)
            $0.leading.equalTo(locationLabel.snp.leading)
        }
        weatherLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.leading.equalTo(locationLabel.snp.leading)
        }
        tempLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(4)
            $0.trailing.equalToSuperview().inset(16)
        }
        maxMinTempLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(10)
            $0.trailing.equalTo(tempLabel.snp.trailing)
        }
    }
}
