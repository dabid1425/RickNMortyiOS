//
//  RMLocationViewModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/12/23.
//  References
//  RMLocationViewViewModel.swift
//  RickAndMorty
//
//  Created by Afraz Siddiqui on 12/28/22.
//

import Foundation
protocol RMLocationViewModelDelegate: AnyObject {
    func didFetchInitialLocations()
}
class RMLocationViewModel {
    weak var delegate: RMLocationViewModelDelegate?
    
    private var locations: [RMLocation] = [] {
        didSet {
            for location in locations {
                let cellViewModel = RMLocationViewCellModel(location: location)
                if !cellViewModelList.contains(where: { $0.name == cellViewModel.name }) {
                    cellViewModelList.append(cellViewModel)
                }
            }
        }
    }
   

    // Location response info
    // WIll contain next url, if present
    var apiInfo: RMGetAllLocationsResponse.Info?
    private var cellViewModelList: [RMLocationViewCellModel] = []
    public var shouldShowLoadMoreIndicator: Bool {
        return apiInfo?.next != nil
    }

    public var isLoadingMoreLocations = false

    private var didFinishPagination: (() -> Void)?

    // MARK: - Init

    init() {}

    func getLocationCellModel() -> [RMLocationViewCellModel] {
        return cellViewModelList
    }
    public func registerDidFinishPaginationBlock(_ block: @escaping () -> Void) {
        self.didFinishPagination = block
    }

    /// Paginate if additional locations are needed
    public func fetchAdditionalLocations() {
        guard !isLoadingMoreLocations else {
            return
        }

        guard let nextUrlString = apiInfo?.next,
              let url = URL(string: nextUrlString) else {
            return
        }

        isLoadingMoreLocations = true

        guard let request = RMRequest(url: url) else {
            isLoadingMoreLocations = false
            return
        }

        RMService.shared.execute(request, expecting: RMGetAllLocationsResponse.self) { [weak self] result in
            guard let strongSelf = self else {
                return
            }
            switch result {
            case .success(let responseModel):
                let moreResults = responseModel.results
                let info = responseModel.info
                strongSelf.apiInfo = info
                strongSelf.locations.append(contentsOf: moreResults)
                DispatchQueue.main.async {
                    strongSelf.isLoadingMoreLocations = false
                    self?.delegate?.didFetchInitialLocations()
                    // Notify via callback
                    strongSelf.didFinishPagination?()
                }
            case .failure(let failure):
                print(String(describing: failure))
                self?.isLoadingMoreLocations = false
            }
        }
    }

    public func location(at index: Int) -> RMLocation? {
        guard index < locations.count, index >= 0 else {
            return nil
        }
        return self.locations[index]
    }

    public func fetchLocations() {
        RMService.shared.execute(
            .listLocationsRequest,
            expecting: RMGetAllLocationsResponse.self
        ) { [weak self] result in
            switch result {
            case .success(let model):
                self?.apiInfo = model.info
                self?.locations = model.results
                DispatchQueue.main.async {
                    self?.delegate?.didFetchInitialLocations()
                }
            case .failure(let error):
                // TODO: Handle error
                break
            }
        }
    }

    private var hasMoreResults: Bool {
        return false
    }
}
