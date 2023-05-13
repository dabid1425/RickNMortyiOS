//
//  ImageButtonModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/13/23.
//

import Foundation
class ImageButtonModel {
    private var image: String
    private var isRounded: Bool
    private var isSystemNamed: Bool
    private var buttonType: ButtonType
    init(image: String, isRounded: Bool, isSystemNamed: Bool, buttonType: ButtonType) {
        self.image = image
        self.isRounded = isRounded
        self.isSystemNamed = isSystemNamed
        self.buttonType = buttonType
    }
    public func setImageView(image: String) {
        self.image = image
    }
    public func setIsRounded(isRounded: Bool) {
        self.isRounded = isRounded
    }
    public func setIsSystemNamed(isSystemNamed: Bool) {
        self.isSystemNamed = isSystemNamed
    }
    public func setButtonType(buttonType: ButtonType) {
        self.buttonType = buttonType
    }
    public var imageString: String {
        return image
    }
    public var isRoundedBool: Bool {
        return isRounded
    }
    public var isSystemNamedBool: Bool {
        return isSystemNamed
    }
    public var buttonTypeEnum: ButtonType {
        return buttonType
    }
}
