//
//  DetailStackViewModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/14/23.
//

import Foundation
class DetailStackViewModel {
    private var leftSideDetailText: String
    private var rightSideDetailText: String
    init(leftSideDetailText: String, rightSideDetailText: String ) {
        self.rightSideDetailText = rightSideDetailText
        self.leftSideDetailText = leftSideDetailText
    }
    public var leftDetail: String {
        return leftSideDetailText
    }
    public var rightDetail: String {
        return leftSideDetailText
    }
}
