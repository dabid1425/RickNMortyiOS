//
//  RMLocationDetailViewController.swift
//  RickNMorty
//  cells that show the residents and when clicking cell opens character detail vc
//  Created by Dan Abid on 6/15/23.
//

import Foundation
import UIKit
class RMLocationDetailViewController : UIViewController {
    private var rmLocationDetailViewModel: RMLocationDetailViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    }
    func configure(rmLocationDetailViewModel: RMLocationDetailViewModel){
        self.rmLocationDetailViewModel = rmLocationDetailViewModel
        self.rmLocationDetailViewModel.fetchCharacters()
    }
}
