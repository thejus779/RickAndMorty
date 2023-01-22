//
//  CharachtersViewController.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 21/01/2023.
//

import UIKit

class CharachtersViewController: UIViewController, Spawnable {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet private weak var loader: UIActivityIndicatorView!
    @IBOutlet private weak var noDataLabel: UILabel!
    
    static var storyboardName: String = R.storyboard.main.name
    
    weak var charachtersCoordinatorDelegate: RMCharachtersCoordinatorDelegate?
    var viewModel: CharachtersViewModel!
    
    static func spawn(charachtersCoordinatorDelegate: RMCharachtersCoordinatorDelegate?, viewModel: CharachtersViewModel) -> CharachtersViewController {
        let controller = CharachtersViewController.spawn()
        controller.charachtersCoordinatorDelegate = charachtersCoordinatorDelegate
        controller.viewModel = viewModel
        return controller
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func loadData() {
        loader.showLoader()
        noDataLabel.isHidden = true
        viewModel.getAllCharachters { [weak self] result in
            self?.loader.hideLoader()
            switch result {
            case .failure(let error):
                self?.presentAlert(message: error.localizedDescription, completion: nil)
            default: break
            }
            self?.reloadData()
        }
    }
    // Reload data
    private func reloadData() {
        loader.hideLoader()
        
        tableView.isHidden = viewModel.allCharachters.isEmpty
        tableView.reloadData()

        noDataLabel.text = R.string.localizable.commonNoinfo()
        noDataLabel.isHidden = !viewModel.allCharachters.isEmpty
    }
}
// MARK: - Table View Delegate impementations
extension CharachtersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.allCharachters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard   let cell = tableView.dequeueReusableCell(
            withIdentifier: CharachterCell.kReuseIdentifier,
            for: indexPath
        ) as? CharachterCell
        else { fatalError("Developer error, wrong cell") }
        
        cell.configure(
            viewModel: CharachterCellViewModel(charachter: viewModel.allCharachters[indexPath.row])
        )
        // Local pagination, Last cell reached, load more data if needed
        if indexPath.item == viewModel.allCharachters.count - 1 {
            loadMore()
        }
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let charachter = viewModel.allCharachters[indexPath.row]
        charachtersCoordinatorDelegate?.showDetails(of: charachter)
    }
    
    private func loadMore() {
        viewModel.loadMoreCharachtersIfNeeded { [weak self] error in
            if let error = error {
                self?.presentAlert(message: error.localizedDescription, completion: nil)
            }
            self?.reloadData()
        }
    }
}
