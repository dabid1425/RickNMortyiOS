//
//  RMLocationDetailViewController.swift
//  RickNMorty
//  cells that show the residents and when clicking cell opens character detail vc
//  Created by Dan Abid on 6/15/23.
//

import Foundation
import UIKit
class RMLocationDetailViewController : UIViewController {
    @IBOutlet var charactersInLocationStackView: UIStackView!
    @IBOutlet var locationLabelStackView: UIStackView!
    private var rmLocationDetailViewModel: RMLocationDetailViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    func setUp(){
       //use detail Stack view for the labels and then use CharacterStackView for the characters
        for view in self.locationLabelStackView.arrangedSubviews{
              self.locationLabelStackView.removeArrangedSubview(view)
              view.removeFromSuperview()
        }
        for view in self.charactersInLocationStackView.arrangedSubviews{
              self.charactersInLocationStackView.removeArrangedSubview(view)
              view.removeFromSuperview()
        }
        DispatchQueue.main.async {
            for view in self.rmLocationDetailViewModel.createLocationStackView() {
                self.locationLabelStackView.addArrangedSubview(view)
            }
            for view in self.rmLocationDetailViewModel.createCharactersStackView() {
                self.locationLabelStackView.addArrangedSubview(view)
            }
        }
    }
    func configure(rmLocationDetailViewModel: RMLocationDetailViewModel){
        self.rmLocationDetailViewModel = rmLocationDetailViewModel
        self.rmLocationDetailViewModel.fetchCharacters()
    }
}
