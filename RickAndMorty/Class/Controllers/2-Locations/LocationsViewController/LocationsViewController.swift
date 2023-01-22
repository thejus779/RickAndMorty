//
//  LocationsViewController.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import UIKit

class LocationsViewController: UIViewController, Spawnable {
    
    static var storyboardName: String = R.storyboard.main.name
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var loader: UIActivityIndicatorView!
    @IBOutlet private weak var noDataLabel: UILabel!
    
    var viewModel: LocationsViewModel!
    
    static func spawn(viewModel: LocationsViewModel) -> LocationsViewController {
        let controller = LocationsViewController.spawn()
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
        viewModel.getAllLocations { [weak self] result in
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
        
        tableView.isHidden = viewModel.allLocations.isEmpty
        tableView.reloadData()

        noDataLabel.text = R.string.localizable.commonNoinfo()
        noDataLabel.isHidden = !viewModel.allLocations.isEmpty
    }
}
// MARK: - Table View Delegate impementations
extension LocationsViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.allLocations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard   let cell = tableView.dequeueReusableCell(
            withIdentifier: LocationCell.kReuseIdentifier,
            for: indexPath
        ) as? LocationCell
        else { fatalError("Developer error, wrong cell") }
        
        cell.configure(
            viewModel: LocationCellViewModel(location: viewModel.allLocations[indexPath.row])
        )
        // Local pagination, Last cell reached, load more data if needed
        if indexPath.item == viewModel.allLocations.count - 1 {
            loadMore()
        }
        return cell
    }
    
    private func loadMore() {
        viewModel.loadMoreLocationsIfNeeded { [weak self] error in
            if let error = error {
                self?.presentAlert(message: error.localizedDescription, completion: nil)
            }
            self?.reloadData()
        }
    }
}

