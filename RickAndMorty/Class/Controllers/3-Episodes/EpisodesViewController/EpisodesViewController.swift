//
//  EpisodesViewController.swift
//  RickAndMorty
//
//  Created by Thejus Thejus on 22/01/2023.
//

import UIKit

class EpisodesViewController: UIViewController, Spawnable {
    
    static var storyboardName: String = "Main"
    
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var loader: UIActivityIndicatorView!
    @IBOutlet private weak var noDataLabel: UILabel!
    
    var viewModel: EpisodesViewModel!
    
    static func spawn(viewModel: EpisodesViewModel) -> EpisodesViewController {
        let controller = EpisodesViewController.spawn()
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
        viewModel.getAllEpisodes { [weak self] result in
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
        
        tableView.isHidden = viewModel.allEpisodes.isEmpty
        tableView.reloadData()

        noDataLabel.text = "No data found"
        noDataLabel.isHidden = !viewModel.allEpisodes.isEmpty
    }
}
// MARK: - Table View Delegate impementations
extension EpisodesViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.allEpisodes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard   let cell = tableView.dequeueReusableCell(
            withIdentifier: EpisodeCell.kReuseIdentifier,
            for: indexPath
        ) as? EpisodeCell
        else { fatalError("Developer error, wrong cell") }
        
        cell.configure(
            viewModel: EpisodeCellViewModel(episode: viewModel.allEpisodes[indexPath.row])
        )
        // Local pagination, Last cell reached, load more data if needed
        if indexPath.item == viewModel.allEpisodes.count - 1 {
            loadMore()
        }
        return cell
    }
    
    private func loadMore() {
        viewModel.loadMoreEpisodesIfNeeded { [weak self] error in
            if let error = error {
                self?.presentAlert(message: error.localizedDescription, completion: nil)
            }
            self?.reloadData()
        }
    }
}
