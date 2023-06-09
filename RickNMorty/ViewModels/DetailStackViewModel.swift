//
//  DetailStackViewModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/14/23.
//

import Foundation
class DetailStackViewModel {
    private var detailStackModel: DetailStackModel
    init(detailStackModel: DetailStackModel) {
           self.detailStackModel = detailStackModel
    }
    func getRightSide() -> String{
        return detailStackModel.rightSide
    }
    func setRightSide(rightSide: String){
        detailStackModel.rightSide = rightSide
    }
    func getLeftSide() -> String{
        return detailStackModel.leftSide
    }
    func setLeftSide(leftSide: String){
        detailStackModel.leftSide = leftSide
    }
}
