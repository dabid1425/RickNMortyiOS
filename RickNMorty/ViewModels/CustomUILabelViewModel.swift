//
//  CustomUILabelViewModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 6/9/23.
//

import Foundation
import UIKit
class CustomUILabelViewModel {
    private var customUILabelModel: CustomUILabelModel
    init(customUILabelModel: CustomUILabelModel) {
        self.customUILabelModel = customUILabelModel
    }
    func getPlaceHolderText() -> String{
        return customUILabelModel.label
    }
    func setPlaceHolderText(label: String){
        customUILabelModel.label = label
    }
    func getLeftImage() -> String{
        return customUILabelModel.leftImage
    }
    func setLeftImage(leftImage: String){
        customUILabelModel.leftImage = leftImage
    }
    func getRightImage() -> String{
        return customUILabelModel.rightImage
    }
    func setRightImage(rightImage: String){
        customUILabelModel.rightImage = rightImage
    }
    func getStackAlignment() -> StackViewDistribution{
        return customUILabelModel.stackAlignment
    }
    func setStackAlignment(stackAlignment: StackViewDistribution){
        customUILabelModel.stackAlignment = stackAlignment
    }
    func getCurveRadius() -> Int{
        return customUILabelModel.curveRadius
    }
    func setCurveRadius(curveRadius: Int){
        customUILabelModel.curveRadius = curveRadius
    }
    func getBorderWidth() -> Int{
        return customUILabelModel.boarderWidth
    }
    func setBorderWidth(boarderWidth: Int){
        customUILabelModel.boarderWidth = boarderWidth
    }
    func getGradientStart() -> CGPoint{
        return customUILabelModel.gradientStart
    }
    func setGradientStart(gradientStart: CGPoint){
        customUILabelModel.gradientStart = gradientStart
    }
    func getGradientEnd() -> CGPoint{
        return customUILabelModel.gradientEnd
    }
    func setGradientEnd(gradientEnd: CGPoint){
        customUILabelModel.gradientEnd = gradientEnd
    }
    func getStartColor() -> UIColor{
        return customUILabelModel.startColor
    }
    func setStartColor(startColor: UIColor){
        customUILabelModel.startColor = startColor
    }
    func getEndColor() -> UIColor{
        return customUILabelModel.endColor
    }
    func setEndColor(endColor: UIColor){
        customUILabelModel.endColor = endColor
    }
    func getGradientStartColor() -> UIColor{
        return customUILabelModel.gradientStartColor
    }
    func setGradientStartColor(gradientStartColor: UIColor){
        customUILabelModel.gradientStartColor = gradientStartColor
    }
    func getGradientEndColor() -> UIColor{
        return customUILabelModel.gradientEndColor
    }
    func setGradientEndColor(gradientEndColor: UIColor){
        customUILabelModel.gradientEndColor = gradientEndColor
    }
}
