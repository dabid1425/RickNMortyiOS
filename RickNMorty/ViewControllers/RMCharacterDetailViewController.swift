//
//  RMCharacterDetailViewController.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/11/23.
//

import Foundation
import UIKit
class RMCharacterDetailViewController : UIViewController {
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var characterImageView: CurvedLabelImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    var rmCharacterDetailViewModel: RMCharacterDetailViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        registerCells()
        setUp()
    }
    func setUp(){
        for view in self.stackView.arrangedSubviews{
              self.stackView.removeArrangedSubview(view)
              view.removeFromSuperview()
        }
        DispatchQueue.main.async {
            for view in self.rmCharacterDetailViewModel.createStackView() {
                self.stackView.addArrangedSubview(view)
            }
        }
        self.rmCharacterDetailViewModel.getCharacterModel().fetchImage { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.spinner.stopAnimating()
                    self?.spinner.alpha = 0
                    let image = UIImage(data: data)
                    self?.characterImageView.image = image
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
        }
    }
    func registerCells(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(UINib(nibName: "EpisodeCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: EpisodeCollectionViewCell.cellIdentifier)
    }
    func configure(rmCharacterDetailViewModel: RMCharacterDetailViewModel){
        self.rmCharacterDetailViewModel = rmCharacterDetailViewModel
        self.rmCharacterDetailViewModel.fetchEpisodes()
    }
}
extension RMCharacterDetailViewController : UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rmCharacterDetailViewModel.rmEpisodeViewCellModel.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(
            withReuseIdentifier: EpisodeCollectionViewCell.cellIdentifier,
            for: indexPath
        ) as? EpisodeCollectionViewCell else {
            fatalError("Unsupported cell")
        }
        cell.configure(episodeViewModel: rmCharacterDetailViewModel.rmEpisodeViewCellModel[indexPath.row])
        cell.delegate = self
        return cell
    }
    
    
}
extension RMCharacterDetailViewController : EpisodeModelDelegate {
    func didSelectItem(rmEpisode: RMEpisode) {
        // open episode detail vc 
        print(rmEpisode)
    }
}
