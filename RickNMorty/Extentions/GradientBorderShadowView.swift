//
//  GradientBorderShadowView.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/12/23.
//

import Foundation
import UIKit
@IBDesignable
class GradientBorderShadowView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable override var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var startColor: UIColor = .clear
    @IBInspectable var endColor: UIColor = .clear
    @IBInspectable override var shadowColor: UIColor? {
        didSet {
            layer.shadowColor = shadowColor?.cgColor
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 0 {
        didSet {
            layer.shadowRadius = shadowRadius
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 0 {
        didSet {
            layer.shadowOpacity = shadowOpacity
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = .zero {
        didSet {
            layer.shadowOffset = shadowOffset
        }
    }
    @IBInspectable var gradientStartPoint: CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            updateGradient()
        }
    }

    @IBInspectable var gradientEndPoint: CGPoint = CGPoint(x: 0, y: 0) {
        didSet {
            updateGradient()
        }
    }

    private var gradientLayer: CAGradientLayer? {
        return layer as? CAGradientLayer
    }

    override class var layerClass: AnyClass {
        return CAGradientLayer.self
    }

    private func updateGradient() {
        guard let gradientLayer = gradientLayer else { return }
        gradientLayer.colors = [startColor.cgColor, endColor.cgColor]
        gradientLayer.startPoint = gradientStartPoint
        gradientLayer.endPoint = gradientEndPoint
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
       
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowRadius = shadowRadius
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        
        layer.cornerRadius = cornerRadius
        layer.masksToBounds = true
        gradientLayer?.frame = bounds
        updateGradient()
    }
}
