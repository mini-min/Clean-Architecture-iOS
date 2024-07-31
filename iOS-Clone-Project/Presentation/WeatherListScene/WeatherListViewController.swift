//
//  WeatherListViewController.swift
//  iOS-Clone-Project
//
//  Created by 민 on 7/15/24.
//

import UIKit

import SnapKit

final class WeatherListViewController: UIViewController {
        
    // MARK: - UI Properties
    
    var coordinator: AppCoordinator?
    private let viewModel: WeatherListViewModel
    
    private let searchController = UISearchController()
    private let weatherListView = WeatherListView()
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    // MARK: - Life Cycle
    
    init(viewModel: WeatherListViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        self.view = weatherListView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupDelegate()
        setupBindings()
        setupNavigationBar()
        setupSearchBar()
        setupActivityIndicator()
        viewModel.didSearch(cities: ["seoul", "cheonan", "busan", "daegu", "jeju"])
    }
    
}

// MARK: - Private Extensions

private extension WeatherListViewController {
    func setupDelegate() {
        weatherListView.tableView.delegate = self
        weatherListView.tableView.dataSource = self
    }
    
    func setupBindings() {
        viewModel.weathers.bind { [weak self] _ in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
                self?.weatherListView.tableView.reloadData()
            }
        }
        viewModel.errors.bind { error in
            print("🚨Error Occurred: \(error)")
        }
    }
    
    func setupNavigationBar() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = .black
        navigationController?.navigationBar.titleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.title = "Weather"
        navigationController?.navigationBar.largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "goforward"),
            style: .plain,
            target: self,
            action: #selector(reloadButtonTapped)
        )
        navigationItem.rightBarButtonItem?.tintColor = .white
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    func setupSearchBar() {
        navigationItem.searchController = searchController
        navigationItem.searchController?.searchBar.placeholder = "Search for a city or airport"
        let textFieldInsideSearchBar = navigationItem.searchController?.searchBar.value(forKey: "searchField") as? UITextField
        textFieldInsideSearchBar?.textColor = .white
    }
    
    func setupActivityIndicator() {
        activityIndicator.color = .white
        activityIndicator.hidesWhenStopped = true
        weatherListView.addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints { $0.center.equalToSuperview() }
    }
    
    @objc
    func reloadButtonTapped() {
        activityIndicator.startAnimating()
        viewModel.didSearch(cities: ["seoul", "cheonan", "busan", "daegu", "jeju"])
    }
}

// MARK: - TableView Delegate

extension WeatherListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        coordinator?.showDetailWeatherViewController()
    }
}

// MARK: - TableView DataSource

extension WeatherListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.weathers.value.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: WeatherListTableViewCell.className,
            for: indexPath) as? WeatherListTableViewCell else { return UITableViewCell() }
        cell.selectionStyle = .none
        let data = viewModel.weathers.value[indexPath.row]
        cell.bindData(data: data, row: indexPath.row)
        return cell
    }
}
