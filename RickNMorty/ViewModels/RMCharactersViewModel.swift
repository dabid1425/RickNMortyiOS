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

protocol RMCharactersListViewViewModelDelegate: AnyObject {
    func didLoadInitialCharacters()
    func didLoadMoreCharacters()
}

class RMCharactersViewModel {
   
    public var apiInfo: RMGetAllCharactersResponse.Info? = nil
    public weak var delegate: RMCharactersListViewViewModelDelegate?
    var tableView = true
    var filteredSearch = false
    public var isLoadingMoreCharacters = false
    var sortType: SortingOption!
    var changeViewStyle = ImageButtonViewModel(imageButtonModel: ImageButtonModel(image: "tablecells.fill", isRounded: true, isSystemNamed: true, buttonType: .changeView))
        var changeSortStyle = ImageButtonViewModel(imageButtonModel: ImageButtonModel(image: "filter", isRounded: true, isSystemNamed: false, buttonType: .sort))
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
    public func searchList(searchText: String){
        filteredCellViewModelList = cellViewModelList.filter { $0.name.lowercased().contains(searchText.lowercased()) }
    }
    private var cellViewModelList: [RMCharacterViewCellModel] = []
    private var filteredCellViewModelList: [RMCharacterViewCellModel] = []
    public func getCharactersCellViewModel() -> [RMCharacterViewCellModel]{
        return cellViewModelList
    }
    public func getFilteredCharactersCellViewModel() -> [RMCharacterViewCellModel]{
        return filteredCellViewModelList
    }
    public func getCharacters() -> [RMCharacter]{
        return characters
    }
    
    func sortData() {
        switch sortType {
        case .ascending:
            cellViewModelList.sort { $0.name < $1.name }
            characters.sort { $0.name < $1.name }
        case .descending:
            cellViewModelList.sort { $0.name > $1.name }
            characters.sort { $0.name > $1.name }
        case .alive:
            cellViewModelList.sort { $0.characterStatusText == "Alive" && $1.characterStatusText != "Alive" }
            characters.sort { $0.status.rawValue == "Alive" && $1.status.rawValue != "Alive" }
        case .dead:
            cellViewModelList.sort { $0.characterStatusText == "Dead" && $1.characterStatusText != "Dead" }
            characters.sort { $0.status.rawValue == "Dead" && $1.status.rawValue != "Dead" }
        case .unknown:
            cellViewModelList.sort { $0.characterStatusText == "Unknown" && $1.characterStatusText != "Unknown" }
            characters.sort { $0.status.rawValue == "unknown" && $1.status.rawValue != "unknown" }
        case .none:
            break
        }
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
                self?.sortData()
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
