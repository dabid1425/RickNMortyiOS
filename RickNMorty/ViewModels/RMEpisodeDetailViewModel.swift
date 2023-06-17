//
//  RMEpisodeDetailViewModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 6/15/23.
//

import Foundation
class RMEpisodeDetailViewModel {
    private let episodeModel: RMEpisodeDetailModel
    var rmEpisodeViewCellModel = [RMEpisodeViewCellModel]()
    init(episodeModel: RMEpisodeDetailModel) {
        self.episodeModel = episodeModel
    }
}
