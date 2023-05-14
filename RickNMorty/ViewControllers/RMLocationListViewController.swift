//
//  RMLocationListViewController.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/10/23.
//

import Foundation
import UIKit
class RMLocationListViewController: UIViewController{
    private var locationViewModel = RMLocationViewModel()
    @IBOutlet var tableView: UITableView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Locations"
        registerCells()
        spinner.startAnimating()
        locationViewModel.fetchLocations()
        locationViewModel.delegate = self
    }
    private func registerCells() {
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UINib(nibName: "LocationTableViewCell", bundle: nil), forCellReuseIdentifier: LocationTableViewCell.cellIdentifier)
        
    }
}
extension RMLocationListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return locationViewModel.getLocationCellModel().count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: LocationTableViewCell.cellIdentifier,
            for: indexPath
        ) as? LocationTableViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(rmLocationCellModel: locationViewModel.getLocationCellModel()[indexPath.row])
        return cell
    }
    
    
}
extension RMLocationListViewController: RMLocationViewModelDelegate {
    func didFetchInitialLocations() {
        spinner.alpha = 0
        spinner.stopAnimating()
        tableView.reloadData()
    }
    
    
}
extension RMLocationListViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        guard locationViewModel.shouldShowLoadMoreIndicator,
              !locationViewModel.isLoadingMoreLocations,
              !locationViewModel.getLocationCellModel().isEmpty else {
            return
        }
        Timer.scheduledTimer(withTimeInterval: 0.2, repeats: false) { [weak self] t in
            let offset = scrollView.contentOffset.y
            let totalContentHeight = scrollView.contentSize.height
            let totalScrollViewFixedHeight = scrollView.frame.size.height
            
            if offset >= (totalContentHeight - totalScrollViewFixedHeight - 120) {
                self?.spinner.alpha = 1
                self?.spinner.startAnimating()
                self?.locationViewModel.fetchAdditionalLocations()
            }
            t.invalidate()
        }
    }
}
