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
    private func bindViewModel() {
        guard let viewModel = viewModel else { return }
        
    }
}
