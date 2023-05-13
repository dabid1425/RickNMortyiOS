//
//  RMEpisodeViewModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/13/23.
//

import Foundation

class RMEpisodeViewModel {
    private let episodeDataUrl: URL?
   
    // MARK: - Init

    init(episodeDataUrl: URL?) {
        self.episodeDataUrl = episodeDataUrl
    }


    public func fetchEpisode(completion: @escaping (Result<RMEpisode, Error>) -> Void) {


        guard let url = episodeDataUrl,
              let request = RMRequest(url: url) else {
            return
        }
        RMService.shared.execute(request, expecting: RMEpisode.self) { [weak self] result in
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
