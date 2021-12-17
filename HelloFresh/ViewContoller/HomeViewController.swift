//
//  HomeViewController.swift
//  HelloFresh
//
//  Created by Saiefeddine HAYOUNI on 03/12/2021.
//

import UIKit

class HomeViewController: UIViewController, Storyboarded {

    // MARK: - IBOutlet
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var errorView: UIView!
    // MARK: - properties
    var viewModel: HomeViewModelProtocol?
    
    // MARK: - public function
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchData()
    }

    // MARK: - private function
    private func fetchData() {
        viewModel?.fetchData(completion: { [weak self] noError in
            guard let self = self else { return }
            self.errorView.isHidden = noError
            if noError {
                self.tableView.reloadData()
            }
        })
    }

    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.registerNibCell(ofType: RecepiesTableViewCell.self)
    }

    @IBAction func retryButton(_ sender: Any) {
        self.errorView.isHidden = true
        fetchData()
    }
}

// MARK: - UITableViewDelegate
extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as? RecepiesTableViewCell
        guard let model = viewModel else { return }
        let isSelected = model.isSelected(index: indexPath)
        model.didSelectRecipe(index: indexPath, isSelected: model.isSelected(index: indexPath))
        if model.canSelect(isSelected: isSelected) {
            cell?.didSelectRecepie(isSelected: isSelected)
        }
    }
}
// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.numberOfItems() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(ofType: RecepiesTableViewCell.self, for: indexPath)
        cell.setup(model: viewModel?.recipeModel(at: indexPath))
        return cell
    }
}


