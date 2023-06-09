//
//  ImageButton.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/12/23.
//

import Foundation
import UIKit
protocol ImageButtonViewClicked : AnyObject{
    func buttonClicked(viewModel: ImageButtonViewModel)
}
class ImageButtonView : UIView{
    @IBOutlet var button: UIButton!
    @IBOutlet var imageButton: CurvedLabelImageView!
    @IBOutlet var gradientView: GradientBorderShadowView!
    weak var delegate: ImageButtonViewClicked!
    var viewModel: ImageButtonViewModel? {
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
           let nib = UINib(nibName: "ImageButtonView", bundle: bundle)
           let view = nib.instantiate(withOwner: self, options: nil).first as! UIView
           addSubview(view)
           view.frame = bounds
           view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
           
       }
    private func bindViewModel() {
        guard let viewModel = viewModel else { return }
        imageButton.image = viewModel.getIsSystemNamed() ? UIImage(systemName: viewModel.getImageString()) : UIImage(named: viewModel.getImageString())
        gradientView.isCircle = viewModel.getIsRoundedBool()
    }
    @IBAction func itemClicked(_ sender: UIButton) {
        if let viewModel = viewModel {
            delegate?.buttonClicked(viewModel: viewModel)
        }
       
    }
}
