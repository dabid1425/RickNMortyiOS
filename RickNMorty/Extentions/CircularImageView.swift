//
//  CircularImageView.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/12/23.
//

import UIKit
@IBDesignable class CurvedLabelImageView: UIImageView {

    @IBInspectable var labelText: String? {
        didSet {
            label.text = labelText
        }
    }
    
    @IBInspectable var labelTextColor: UIColor = .white {
        didSet {
            label.textColor = labelTextColor
        }
    }
    
    
    @IBInspectable var labelCurveRadius: CGFloat = 10 {
        didSet {
            updateLabel()
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable override var borderColor: UIColor? {
        didSet {
            layer.borderColor = borderColor?.cgColor
        }
    }
    
    private let label = UILabel()

    override func awakeFromNib() {
        super.awakeFromNib()
        setupLabel()
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupLabel()
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        updateLabel()
    }
    
    private func setupLabel() {
        label.textAlignment = .center
        label.numberOfLines = 0
        addSubview(label)
    }
    
    private func updateLabel() {
        let labelHeight: CGFloat = 30
        let labelY = bounds.height - labelHeight
        let labelX = bounds.width / 2 - (bounds.width - labelCurveRadius * 2) / 2
        
        label.frame = CGRect(x: labelX, y: labelY, width: bounds.width - labelCurveRadius * 2, height: labelHeight)
        label.adjustsFontSizeToFitWidth = true
        label.layer.masksToBounds = true
        label.textColor = labelTextColor
        label.font = UIFont.boldSystemFont(ofSize: 16)
        layer.cornerRadius = bounds.width / 2
        layer.masksToBounds = true
    }

}
