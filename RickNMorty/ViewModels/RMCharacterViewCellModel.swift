//
//  RMCharacterViewCellModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/12/23.
//

import Foundation
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
    
    public func getCharacter() -> RMCharacter {
        return character
    }
    public func fetchImage(completion: @escaping (Result<Data, Error>) -> Void) {
        // TODO: Abstract to Image Manager
        guard let url = URL(string: character.url) else {
            completion(.failure(URLError(.badURL)))
            return
        }
        RMImageLoader.shared.downloadImage(url, completion: completion)
    }

}
