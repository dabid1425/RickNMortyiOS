//
//  CustomUILabelModel.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/23/23.
//

import Foundation
import UIKit
class CustomUILabelModel{
    var label: String = ""
    var leftImage: String = ""
    var rightImage: String = ""
    var curveRadius: Int = 0
    var boarderWidth: Int = 0
    var stackAlignment: StackViewDistribution = .fill
    var startColor: UIColor = .clear
    var endColor: UIColor = .clear
    var boarderColor: UIColor = .clear
    var gradientStartColor: UIColor = .clear
    var gradientEndColor: UIColor = .clear
    var gradientStart: CGPoint = CGPoint(x: 0.0, y: 0.0)
    var gradientEnd: CGPoint = CGPoint(x: 0.0, y: 0.0)
    
}
