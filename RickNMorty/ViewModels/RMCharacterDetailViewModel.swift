//
//  RMCharacterDetailViewModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/14/23.
//

import Foundation
import UIKit
class RMCharacterDetailViewModel {
    private let characterModel: RMCharacterDetailModel
    var rmEpisodeViewCellModel = [RMEpisodeViewCellModel]()
    init(characterModel: RMCharacterDetailModel) {
        self.characterModel = characterModel
    }
    public func createStackView() -> [UIView] {
        var itemsInView = [UIView]()
        var anotherCustomView =  DetailedStackView()
        anotherCustomView.labelRightSide.text = characterModel.name
        anotherCustomView.labelLeftSide.text = "Name"

        itemsInView.append(anotherCustomView)
        
        anotherCustomView =  DetailedStackView()
        anotherCustomView.labelRightSide.text = characterModel.gender
        anotherCustomView.labelLeftSide.text = "Gender"
        itemsInView.append(anotherCustomView)
        
        anotherCustomView =  DetailedStackView()
        anotherCustomView.labelRightSide.text = characterModel.characterStatusText
        anotherCustomView.labelLeftSide.text = "Status"
        itemsInView.append(anotherCustomView)
        return itemsInView
    }
    public func getCharacterModel() -> RMCharacterDetailModel{
        return characterModel
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
