//
//  RMCharacterViewCellModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/12/23.
//

import Foundation
import UIKit
class RMCharacterViewCellModel {
    private let character: RMCharacter
    init(character: RMCharacter) {
        self.character = character
    }
    public var name: String {
        return character.name
    }
    public var characterStatusText: String {
        return character.status.text
    }
    public var characterStatus: RMCharacterStatus{
        return character.status
    }
    public var gender: String{
        return character.gender.rawValue
    }
    public var firstEpisode: String {
        return character.episode[0]
    }
    public var lastEpisode: String {
        return character.episode[character.episode.count - 1]
    }
    
    public var gradientStartColor: UIColor {
        switch (character.status){
        case .dead:
            return .systemPurple
        case .alive:
            return .systemTeal
        default:
            return .yellow
        }
    }
    public var gradientEndColor: UIColor {
        switch (character.status){
        case .dead:
            return .systemRed
        case .alive:
            return .systemGreen
        default:
            return .systemPink
        }
    }
    public var labelTextColor: UIColor {
        switch (character.status){
        case .dead:
            return .red
        case .alive:
            return .green
        default:
            return .yellow
        }
    }
    public var borderColor: UIColor {
        switch (character.status){
        case .dead:
            return .red
        case .alive:
            return .green
        default:
            return .yellow
        }
    }
    
    public func getCharacter() -> RMCharacter {
        return character
    }
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: character.image) {
            RMImageLoader.shared.downloadImage(url, completion: completion)
        }
    }
    public func fetchEpisode(episodeName: String, completion: @escaping (Result<RMEpisode, Error>) -> Void) {
        if let episodeURL = URL(string: episodeName) {
            let episodeModel = RMEpisodeViewModel(episodeDataUrl: episodeURL)
            episodeModel.fetchEpisode(completion: completion)
        }
    }
}
