//
//  MealsViewController.swift
//  RecipeApp
//
//  Created by Berk on 12.02.2023.
//

import UIKit

class MealsViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    // ViewModel
    var viewModel: MealsViewModel = MealsViewModel()
    
    // Variables
    var cellDataSource: [MealDetails] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        bindViewModel()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel.getData()
    }
    
    func configureUI() {
        self.title = "Meals"
        self.view.backgroundColor = .systemIndigo
        setupTableView()
    }
    
    func bindViewModel() {
        viewModel.isLoading.bind { [weak self] result in
            guard let self = self, let result = result else { return }
            DispatchQueue.main.async {
                if result {
                    self.activityIndicator.startAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                }
            }
        }
        
        viewModel.cellDataSource.bind { [weak self] mealDetails in
            guard let self = self, let mealDetails = mealDetails else { return }
            self.cellDataSource = mealDetails
            self.reloadTableView()
        }
    }
}

extension MealsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func setupTableView() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.backgroundColor = .clear
        
        registerCell()
    }
    
    func registerCell() {
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
    }
    
    func reloadTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        viewModel.numberOfSection()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberOfRows(in: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.cellDataSource[indexPath.row].strMeal
        return cell
    }
}
