//
//  EpisodeCollectionViewCell.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/14/23.
//

import UIKit

class EpisodeCollectionViewCell: UICollectionViewCell {
    @IBOutlet var airDate: UILabel!
    @IBOutlet var seasonNumber: UILabel!
    @IBOutlet var episodeName: UILabel!
    static let cellIdentifier = "EpisodeCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        seasonNumber.adjustsFontSizeToFitWidth = true
        airDate.adjustsFontSizeToFitWidth = true
        episodeName.adjustsFontSizeToFitWidth = true
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        seasonNumber.text = nil
        episodeName.text = nil
        airDate.text = nil
    }
    func configure(episodeViewModel: RMEpisodeViewCellModel){
        airDate.text = episodeViewModel.airDate
        episodeName.text = episodeViewModel.name
        seasonNumber.text = episodeViewModel.episodeName
    }
}
