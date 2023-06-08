//
//  CustomLabelView.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/15/23.
//

import Foundation
import UIKit
class CustomLabelView: UIView{

    @IBOutlet var rightImageView: UIImageView!
    @IBOutlet var leftImageView: UIImageView!
    @IBOutlet var horizontalStackView: UIStackView!
    @IBOutlet var label: UILabel!
    @IBOutlet var gradientView: GradientBorderShadowView!
    var viewModel: CustomUILabelModel? {
          didSet {
              bindViewModel()
          }
      }
    override init(frame: CGRect) {
           super.init(frame: frame)
           setupView()
       }
       
       required init?(coder aDecoder: NSCoder) {
           super.init(coder: aDecoder)
           setupView()
       }
       
       private func setupView() {
           let bundle = Bundle(for: type(of: self))
           let nib = UINib(nibName: "TextFieldView", bundle: bundle)
           let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
           addSubview(view)
           view.frame = bounds
           view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
       }
    private func bindViewModel() {
        guard let viewModel = viewModel else { return }
        
    }
}
