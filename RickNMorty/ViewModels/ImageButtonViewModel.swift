//
//  ImageButtonViewModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 6/9/23.
//

import Foundation
class ImageButtonViewModel{
    private var imageButtonModel: ImageButtonModel
    init(imageButtonModel: ImageButtonModel) {
           self.imageButtonModel = imageButtonModel
    }
    func setImageView(image: String) {
        self.imageButtonModel.image = image
    }
    func setIsRounded(isRounded: Bool) {
        self.imageButtonModel.isRounded = isRounded
    }
    func setIsSystemNamed(isSystemNamed: Bool) {
        self.imageButtonModel.isSystemNamed = isSystemNamed
    }
    func setButtonType(buttonType: ButtonType) {
        self.imageButtonModel.buttonType = buttonType
    }
    func getImageString() -> String {
        return imageButtonModel.image
    }
    func getIsRoundedBool() -> Bool {
        return imageButtonModel.isRounded
    }
    func getIsSystemNamed() -> Bool {
        return imageButtonModel.isSystemNamed
    }
    func getButtonType() -> ButtonType {
        return imageButtonModel.buttonType
    }
}
