//
//  RMCharacterViewModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/10/23.
// References
//
//  CharacterListViewViewModel.swift
//  RickAndMorty
//
//  Created by Afraz Siddiqui on 12/23/22.
//


import Foundation

protocol RMCharacterListViewViewModelDelegate: AnyObject {
    func didLoadInitialCharacters()
    func didLoadMoreCharacters()
}

class RMCharacterViewModel {
   
    public var apiInfo: RMGetAllCharactersResponse.Info? = nil
    public weak var delegate: RMCharacterListViewViewModelDelegate?
    var tableView = true
    public var isLoadingMoreCharacters = false

    private var characters: [RMCharacter] = [] {
        didSet {
            for character in characters {
                let cellViewModel = RMCharacterViewCellModel(character: character)
                if !cellViewModelList.contains(where: { $0.name == cellViewModel.name }) {
                    cellViewModelList.append(cellViewModel)
                }
            }
        }
    }

    private var cellViewModelList: [RMCharacterViewCellModel] = []
    //need to change to a TableCellViewModel and a CollectionCellViewModel list that fetches the image inside the VM
    public func getCharacters() -> [RMCharacterViewCellModel]{
        return cellViewModelList
    }
    
    public func fetchCharacters() {
        RMService.shared.execute(
            .listCharactersRequests,
            expecting: RMGetAllCharactersResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let responseModel):
                let results = responseModel.results
                let info = responseModel.info
                self?.characters = results
                self?.apiInfo = info
                DispatchQueue.main.async {
                    self?.delegate?.didLoadInitialCharacters()
                }
            case .failure(let error):
                print(String(describing: error))
            }
        }
    }
    public func fetchAdditionalCharacters(url: URL) {
        guard !isLoadingMoreCharacters else {
            return
        }
        isLoadingMoreCharacters = true
        guard let request = RMRequest(url: url) else {
            isLoadingMoreCharacters = false
            return
        }
        
        RMService.shared.execute(request, expecting: RMGetAllCharactersResponse.self) { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            switch result {
            case .success(let responseModel):
                let moreResults = responseModel.results
                let info = responseModel.info
                strongSelf.apiInfo = info
                strongSelf.characters.append(contentsOf: moreResults)

                DispatchQueue.main.async {
                    strongSelf.delegate?.didLoadMoreCharacters()
                    strongSelf.isLoadingMoreCharacters = false
                }
            case .failure(let failure):
                print(String(describing: failure))
                self?.isLoadingMoreCharacters = false
            }
        }
    }

    public var shouldShowLoadMoreIndicator: Bool {
        return apiInfo?.next != nil
    }
}
