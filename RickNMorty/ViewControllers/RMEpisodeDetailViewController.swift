//
//  RMEpisodeDetailViewController.swift
//  RickNMorty
//
//  Created by Dan Abid on 6/15/23.
//

import Foundation
import UIKit
class RMEpisodeDetailViewController : UIViewController {
    private var rmEpisodeDetailViewModel: RMEpisodeDetailViewModel!
    override func viewDidLoad() {
        super.viewDidLoad()
        setUp()
    }
    func setUp(){
       //use detail Stack view for the labels and then use CharacterStackView for the characters
        
        
    }
    func configure(rmEpisodeDetailViewModel: RMEpisodeDetailViewModel){
        self.rmEpisodeDetailViewModel = rmEpisodeDetailViewModel
        
    }
}
