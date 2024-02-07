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
        var detailModel = DetailStackModel()
        detailModel.rightSide = characterModel.name
        detailModel.leftSide = "Name"
        var detailViewModel = DetailStackViewModel(detailStackModel: detailModel)
        anotherCustomView.viewModel = detailViewModel
        itemsInView.append(anotherCustomView)
        
        anotherCustomView =  DetailedStackView()
        detailModel = DetailStackModel()
        detailModel.rightSide = characterModel.gender
        detailModel.leftSide = "Gender"
        detailViewModel = DetailStackViewModel(detailStackModel: detailModel)
        anotherCustomView.viewModel = detailViewModel
        itemsInView.append(anotherCustomView)
        
        anotherCustomView =  DetailedStackView()
        detailModel = DetailStackModel()
        detailModel.rightSide = characterModel.characterStatusText
        detailModel.leftSide = "Status"
        anotherCustomView.gradientBoarderShadowView.backgroundColor = characterModel.characterStatusColor
        detailViewModel = DetailStackViewModel(detailStackModel: detailModel)
        anotherCustomView.viewModel = detailViewModel
        itemsInView.append(anotherCustomView)
        return itemsInView
    }
    public func getCharacterModel() -> RMCharacterDetailModel{
        return characterModel
    }
    
    public func fetchEpisode(episodeName: String, completion: @escaping (Result<RMEpisode, Error>) -> Void) {
        if let episodeURL = URL(string: episodeName) {
            let episodeModel = RMEpisodeViewModel(episodeDataUrl: episodeURL)
            episodeModel.fetchEpisode(completion: completion)
        }
    }
    
    public func fetchEpisodes() {
        for episode in characterModel.episodeList {
            fetchEpisode(episodeName: episode) { [weak self] result in
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
