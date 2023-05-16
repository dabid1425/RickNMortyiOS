//
//  DetailedStackView.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/14/23.
//

import Foundation
import UIKit
class DetailedStackView : UIView {
    
    @IBOutlet var labelRightSide: UILabel!
    @IBOutlet var labelLeftSide: UILabel!
    @IBOutlet var gradientBoarderShadowView: GradientBorderShadowView!
    var viewModel: DetailStackViewModel? {
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
        let nib = UINib(nibName: "DetailedStackView", bundle: bundle)
        let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
        addSubview(view)
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        labelLeftSide.adjustsFontSizeToFitWidth = true
        labelRightSide.adjustsFontSizeToFitWidth = true
        
    }
    private func bindViewModel() {
        guard let viewModel = viewModel else { return }
        labelLeftSide.text = viewModel.leftSide
        labelRightSide.text = viewModel.rightSide
    }
}
