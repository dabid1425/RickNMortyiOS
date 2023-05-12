//
//  ImageButton.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/12/23.
//

import Foundation
import UIKit
protocol ImageButtonViewClicked : AnyObject{
    
}
class ImageButtonView : UIView{
    @IBOutlet var button: UIButton!
    @IBOutlet var imageButton: CurvedLabelImageView!
    @IBOutlet var gradientView: GradientBorderShadowView!
    weak var delegate: ImageButtonViewClicked!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        translatesAutoresizingMaskIntoConstraints = false
        
    }

    required init?(coder: NSCoder) {
        fatalError()
    }
    
    
    @IBAction func itemClicked(_ sender: UIButton) {
        
    }
}
