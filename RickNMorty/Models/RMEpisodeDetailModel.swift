//
//  RMEpisodeDetailModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 6/15/23.
//

import Foundation
class RMEpisodeDetailModel {
    private let episode: RMEpisode
    init(episode: RMEpisode) {
        self.episode = episode
    }
    func getEpisode() -> RMEpisode {
        return episode
    }
}
