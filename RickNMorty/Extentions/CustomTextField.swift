//
//  CustomTextField.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/15/23.
//
import UIKit

import UIKit

@IBDesignable
class CustomTextField: UITextField {

    // MARK: - Text Field Properties

    @IBInspectable override var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    @IBInspectable var placeholderText: String? {
            didSet {
                placeholder = placeholderText
            }
        }

    @IBInspectable var borderWidth: CGFloat = 1.0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }

    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

    // MARK: - Initialization
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupStyling()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupStyling()
    }

    private func setupStyling() {
        borderStyle = .none
    }

    // MARK: - Layout

    override func layoutSubviews() {
        super.layoutSubviews()
        
    }
}
