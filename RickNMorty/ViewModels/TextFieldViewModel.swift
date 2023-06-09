//
//  TextFieldViewModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 6/9/23.
//

import Foundation
import UIKit
class TextFieldViewModel {
    private var textFieldModel: TextFieldModel
    init(textFieldModel: TextFieldModel) {
           self.textFieldModel = textFieldModel
    }
    func getPlaceHolderText() -> String{
        return textFieldModel.placeHolderText
    }
    func setPlaceHolderText(placeHolderText: String){
        textFieldModel.placeHolderText = placeHolderText
    }
    func getCurveRadius() -> Int{
        return textFieldModel.curveRadius
    }
    func setCurveRadius(curveRadius: Int){
        textFieldModel.curveRadius = curveRadius
    }
    func getBorderWidth() -> Int{
        return textFieldModel.boarderWidth
    }
    func setBoarderWidth(boarderWidth: Int){
        textFieldModel.boarderWidth = boarderWidth
    }
    func getFont() -> UIFont{
        return textFieldModel.font
    }
    func setFont(font: UIFont){
        textFieldModel.font = font
    }
    func getGradientViewCurveRadius() -> Int{
        return textFieldModel.gradientViewCurveRadius
    }
    func setGradientViewCurveRadius(gradientViewCurveRadius: Int){
        textFieldModel.gradientViewCurveRadius = gradientViewCurveRadius
    }
    func getGradientViewBoarderWidth() -> Int{
        return textFieldModel.gradientViewBoarderWidth
    }
    func setGradientViewBoarderWidth(gradientViewBoarderWidth: Int){
        textFieldModel.gradientViewBoarderWidth = gradientViewBoarderWidth
    }
    func getGradientViewBoarderColor() -> UIColor{
        return textFieldModel.gradientViewBoarderColor
    }
    func setGradientViewBoarderColor(gradientViewBoarderColor: UIColor){
        textFieldModel.gradientViewBoarderColor = gradientViewBoarderColor
    }
    func getStartColor() -> UIColor{
        return textFieldModel.startColor
    }
    func setStartColor(startColor: UIColor){
        textFieldModel.startColor = startColor
    }
    func getEndColor() -> UIColor{
        return textFieldModel.endColor
    }
    func setEndColor(endColor: UIColor){
        textFieldModel.endColor = endColor
    }
    func getGradientStart() -> CGPoint{
        return textFieldModel.gradientStart
    }
    func setGradientStart(gradientStart: CGPoint){
        textFieldModel.gradientStart = gradientStart
    }
    func getGradientEnd() -> CGPoint{
        return textFieldModel.gradientEnd
    }
    func setGradientEnd(gradientEnd: CGPoint){
        textFieldModel.gradientEnd = gradientEnd
    }
    func getGradientEndColor() -> UIColor{
        return textFieldModel.gradientEndColor
    }
    func setGradientEndColor(gradientEndColor: UIColor){
        textFieldModel.gradientEndColor = gradientEndColor
    }
    func getGradientStartColor() -> UIColor{
        return textFieldModel.gradientStartColor
    }
    func setGradientStartColor(gradientStartColor: UIColor){
        textFieldModel.gradientStartColor = gradientStartColor
    }
}
