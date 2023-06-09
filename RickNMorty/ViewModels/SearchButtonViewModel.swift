//
//  SearchButtonViewModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 6/9/23.
//

import Foundation
class SearchButtonViewModel {
    private var searchButtonModel: SearchButtonModel
    init(searchButtonModel: SearchButtonModel) {
           self.searchButtonModel = searchButtonModel
    }
    func setPlaceHolderText(placeHolderText: String) {
        self.searchButtonModel.placeHolderText = placeHolderText
    }
    func getPlaceHolderText() -> String {
       return self.searchButtonModel.placeHolderText
    }
}
