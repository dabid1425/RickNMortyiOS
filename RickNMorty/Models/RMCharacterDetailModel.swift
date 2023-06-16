//
//  RMCharacterDetailModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/14/23.
//

import Foundation
import UIKit
class RMCharacterDetailModel {
    private let character: RMCharacter
    init(character: RMCharacter) {
        self.character = character
    }
    func getCharacter() -> RMCharacter {
        return character
    }
    public var name: String {
        return character.name
    }
    public var characterStatusText: String {
        return character.status.text
    }
    public var characterStatusColor: UIColor {
        switch(characterStatus){
        case .unknown:
            return .yellow
        case .dead:
            return .red
        case .alive:
            return .green
        }
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
    public var episodeList: [String] {
        return character.episode
    }
    public var lastEpisode: String {
        return character.episode[character.episode.count - 1]
    }
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        if let url = URL(string: character.image) {
            RMImageLoader.shared.downloadImage(url, completion: completion)
        }
    }
}
