//
//  RMCharacterViewModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 6/16/23.
//

import Foundation
class RMCharacterViewModel {
    private let characterDataURL: URL?

    // MARK: - Init

    init(characterDataURL: URL?) {
        self.characterDataURL = characterDataURL
    }


    public func fetchCharacter(completion: @escaping (Result<RMCharacter, Error>) -> Void) {


        guard let url = characterDataURL,
              let request = RMRequest(url: url) else {
            return
        }
        RMService.shared.execute(request, expecting: RMCharacter.self) { [weak self] result in
            switch result {
            case .success(let model):
                completion(.success(model))
                break
            case .failure(let failure):
                print(String(describing: failure))
            }
        }
    }
}
