//
//  ImageButtonModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/13/23.
//

import Foundation
class ImageButtonModel {
    var image: String = ""
    var isRounded: Bool = false
    var isSystemNamed: Bool = false
    var buttonType: ButtonType = .changeView
    init(image: String, isRounded: Bool, isSystemNamed: Bool, buttonType: ButtonType) {
        self.image = image
        self.isRounded = isRounded
        self.isSystemNamed = isSystemNamed
        self.buttonType = buttonType
    }
}
