//
//  RMCharacterDetailViewController.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/11/23.
//

import Foundation
import UIKit
class RMCharacterDetailViewController : UIViewController {
    @IBOutlet var characterImageView: CurvedLabelImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    //var rmCharacterDetailViewModel: RMCharacterDetailModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
//    func configure(rmCharacterDetailViewModel: RMCharacterDetailModel){
//
//    }
}
