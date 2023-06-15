//
//  RMEpisodeListViewController.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/10/23.
//

import Foundation
import UIKit
class RMEpisodeListViewController: UIViewController{
    @IBOutlet var tableView: UITableView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    private var episodeListViewModel = RMEpisodesViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Episodes"
        registerCells()
        episodeListViewModel.fetchEpisodes()
        spinner.startAnimating()
        episodeListViewModel.delegate = self
    }
    private func registerCells() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "EpisodesTableViewCell", bundle: nil), forCellReuseIdentifier: EpisodesTableViewCell.cellIdentifier)
    }
    private func startSpinner(){
        spinner.startAnimating()
        spinner.alpha = 1
    }
    private func stopSpinner(){
        spinner.stopAnimating()
        spinner.alpha = 0
        tableView.reloadData()
    }
}
extension RMEpisodeListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return episodeListViewModel.getCellViewModels().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: EpisodesTableViewCell.cellIdentifier,
            for: indexPath
        ) as? EpisodesTableViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(episodeViewModel: episodeListViewModel.getCellViewModels()[indexPath.row])
        cell.delegate = self
        return cell
    }
}

extension RMEpisodeListViewController: RMEpisodesListViewViewModelDelegate{
    func didLoadInitialEpisodes() {
        stopSpinner()
    }
    
    func didLoadMoreEpisodes() {
        stopSpinner()
    }
}
extension RMEpisodeListViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard episodeListViewModel.shouldShowLoadMoreIndicator,
              !episodeListViewModel.isLoadingMoreCharacters,
              !episodeListViewModel.getCellViewModels().isEmpty,
              let nextUrlString = episodeListViewModel.apiInfo?.next,
              let url = URL(string: nextUrlString) else {
            return
        }
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { [weak self] t in
            let offset = scrollView.contentOffset.y
            let totalContentHeight = scrollView.contentSize.height
            let totalScrollViewFixedHeight = scrollView.frame.size.height
            
            if offset >= (totalContentHeight - totalScrollViewFixedHeight - 120) {
                self?.spinner.alpha = 1
                self?.spinner.startAnimating()
                self?.episodeListViewModel.fetchAdditionalEpisodes(url: url)
            }
            t.invalidate()
        }
    }
}
extension RMEpisodeListViewController : EpisodeModelDelegate {
    func didSelectItem(rmEpisode: RMEpisode) {
        // open episode detail vc 
        print(rmEpisode)
    }
}
