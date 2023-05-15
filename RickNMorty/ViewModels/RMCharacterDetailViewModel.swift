//
//  RMCharacterDetailViewModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/14/23.
//

import Foundation
class RMCharacterDetailViewModel {
    private let characterModel: RMCharacterDetailModel
    var rmEpisodeViewCellModel = [RMEpisodeViewCellModel]()
    init(characterModel: RMCharacterDetailModel) {
        self.characterModel = characterModel
    }
    public func fetchEpisodes() {
        for episode in characterModel.episodeList {
            characterModel.fetchEpisode(episodeName: episode) { [weak self] result in
                switch result {
                case .success(let data):
                    self?.rmEpisodeViewCellModel.append( RMEpisodeViewCellModel(episode: data))
                    break
                case .failure(let error):
                    print(String(describing: error))
                    break
                }
                
            }
        }
    }
}
