//
//  TextFieldModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/23/23.
//

import Foundation
import UIKit
class TextFieldModel{
    var label: String = ""
    var catagoryLabel: String = ""
    var placeHolderText: String = ""
    var curveRadius: Int = 0
    var boarderWidth: Int = 0
    var boarderColor: UIColor = .black
    var font: UIFont = UIFont.systemFont(ofSize: 14)
    var labelVisible: Bool = false
    var gradientViewCurveRadius: Int = 0
    var gradientViewBoarderWidth: Int = 0
    var gradientViewBoarderColor: UIColor = .white
    var startColor: UIColor = .clear
    var endColor: UIColor = .clear
    var gradientStart: CGPoint = CGPoint(x: 0.0, y: 0.0)
    var gradientEnd: CGPoint = CGPoint(x: 0.0, y: 0.0)
    var gradientStartColor: UIColor = .clear
    var gradientEndColor: UIColor = .clear
}
