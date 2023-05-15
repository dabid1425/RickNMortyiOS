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
    var episodeViewModel: RMEpisodeViewCellModel!
    weak var delegate: EpisodeModelDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
            airedDate.adjustsFontSizeToFitWidth = true
            seasonEpisodeNumber.adjustsFontSizeToFitWidth = true
            episodeName.adjustsFontSizeToFitWidth = true
        gradientView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
        }

    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        delegate?.didSelectItem(rmEpisode: episodeViewModel.getEpisode())
        }
        override func prepareForReuse() {
            super.prepareForReuse()
            airedDate.text = nil
            seasonEpisodeNumber.text = nil
            episodeName.text = nil
        }

    func configure(episodeViewModel: RMEpisodeViewCellModel){
        self.episodeViewModel = episodeViewModel
        airedDate.text = episodeViewModel.airDate
        episodeName.text = episodeViewModel.name
        seasonEpisodeNumber.text = episodeViewModel.episodeName
    }
    
}
