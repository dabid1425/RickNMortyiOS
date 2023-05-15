//
//  LabeledTextField.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/15/23.
//

import Foundation
import UIKit
@IBDesignable
class LabeledTextField: UIStackView {

    // MARK: - Properties
    
    private let label = UILabel()
    private let textField = UITextField()

    // MARK: - Initialization
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupView()
    }
    
    // MARK: - Setup
    
    private func setupView() {
        axis = .vertical
        spacing = 8.0
        
        // Configure label
        label.textAlignment = .left
        addArrangedSubview(label)
        
        // Configure text field
        textField.borderStyle = .roundedRect
        addArrangedSubview(textField)
    }
    
    // MARK: - Customization
    
    @IBInspectable
    var labelText: String? {
        get {
            return label.text
        }
        set {
            label.text = newValue
        }
    }
    @IBInspectable
    var placeHolder: String? {
        get {
            return textField.placeholder
        }
        set {
            textField.placeholder = newValue
        }
    }
    
    @IBInspectable
    var textFieldText: String? {
        get {
            return textField.text
        }
        set {
            textField.text = newValue
        }
    }
}

