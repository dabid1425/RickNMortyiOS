//
//  RMLocationDetailViewModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 6/15/23.
//

import Foundation
class RMLocationDetailViewModel {
    private var locationModel: RMLocationDetailModel
    var rmCharacterViewCellModel = [RMCharacterViewCellModel]()
    init(locationModel: RMLocationDetailModel) {
        self.locationModel = locationModel
    }
    public func fetchCharacter(characterString: String, completion: @escaping (Result<RMCharacter, Error>) -> Void) {
        if let characterURL = URL(string: characterString) {
            let characterViewModel = RMCharacterViewModel(characterDataURL: characterURL)
            characterViewModel.fetchCharacter(completion: completion)
        }
    }
    func fetchCharacters(){
        for resident in locationModel.residents {
            fetchCharacter(characterString: resident) { [weak self] result in
                switch result {
                case .success(let data):
                    self?.rmCharacterViewCellModel.append( RMCharacterViewCellModel(character: data))
                    break
                case .failure(let error):
                    print(String(describing: error))
                    break
                }
                
            }
        }
    }
}
