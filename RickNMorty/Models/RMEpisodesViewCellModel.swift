//
//  RMEpisodesViewCellModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/12/23.
//

import Foundation
class RMEpisodeViewCellModel {
    private let episode: RMEpisode

    init(episode: RMEpisode) {
        self.episode = episode
    }
    
    public var name: String {
        return episode.name
    }
    public var episodeName: String {
        return episode.episode
    }
    public var created: String {
        return episode.created
    }
    public var characters: [String]{
        return episode.characters
    }
    public var airDate: String{
        return episode.air_date
    }
    
    public func getEpisode() -> RMEpisode {
        return episode
    }
}
