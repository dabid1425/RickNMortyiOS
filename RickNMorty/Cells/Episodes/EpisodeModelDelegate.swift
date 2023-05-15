//
//  EpisodeModelDelegate.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/15/23.
//

import Foundation
protocol EpisodeModelDelegate: AnyObject {
    func didSelectItem(rmEpisode: RMEpisode)
}
