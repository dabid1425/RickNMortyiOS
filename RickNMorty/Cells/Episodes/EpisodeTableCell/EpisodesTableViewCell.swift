//
//  EpisodesTableViewCell.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/14/23.
//

import UIKit

class EpisodesTableViewCell: UITableViewCell {

    @IBOutlet var gradientView: GradientBorderShadowView!
    @IBOutlet var airedDate: UILabel!
    @IBOutlet var seasonEpisodeNumber: UILabel!
    @IBOutlet var episodeName: UILabel!
    static let cellIdentifier = "EpisodesTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
            airedDate.adjustsFontSizeToFitWidth = true
            seasonEpisodeNumber.adjustsFontSizeToFitWidth = true
            episodeName.adjustsFontSizeToFitWidth = true
        }
        override func prepareForReuse() {
            super.prepareForReuse()
            airedDate.text = nil
            seasonEpisodeNumber.text = nil
            episodeName.text = nil
        }

    func configure(episodeViewModel: RMEpisodeViewCellModel){
        airedDate.text = episodeViewModel.airDate
        episodeName.text = episodeViewModel.name
        seasonEpisodeNumber.text = episodeViewModel.episodeName
    }
    
}
