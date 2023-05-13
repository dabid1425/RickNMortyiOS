//
//  RMCharacterDetailViewController.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/11/23.
//

import Foundation
import UIKit
class RMCharacterDetailViewController : UIViewController {
    @IBOutlet var stackView: UIStackView!
    @IBOutlet var characterImageView: CurvedLabelImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    //var rmCharacterDetailViewModel: RMCharacterDetailModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        for view in self.stackView.arrangedSubviews{
              self.stackView.removeArrangedSubview(view)
              view.removeFromSuperview()
        }
    }
//    func configure(rmCharacterDetailViewModel: RMCharacterDetailModel){
//
//    }
}
