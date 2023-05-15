//
//  EpisodeCollectionViewCell.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/14/23.
//

import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell {
    @IBOutlet var background: GradientBorderShadowView!
    @IBOutlet var airDate: UILabel!
    @IBOutlet var seasonNumber: UILabel!
    @IBOutlet var episodeName: UILabel!
    static let cellIdentifier = "EpisodeCollectionViewCell"
    var episodeViewModel: RMEpisodeViewCellModel!
    weak var delegate: EpisodeModelDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        seasonNumber.adjustsFontSizeToFitWidth = true
        airDate.adjustsFontSizeToFitWidth = true
        episodeName.adjustsFontSizeToFitWidth = true
        background.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
        }

    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        delegate?.didSelectItem(rmEpisode: episodeViewModel.getEpisode())
        }
    override func prepareForReuse() {
        super.prepareForReuse()
        seasonNumber.text = nil
        episodeName.text = nil
        airDate.text = nil
    }
    func configure(episodeViewModel: RMEpisodeViewCellModel){
        self.episodeViewModel = episodeViewModel
        airDate.text = episodeViewModel.airDate
        episodeName.text = episodeViewModel.name
        seasonNumber.text = episodeViewModel.episodeName
    }
}
