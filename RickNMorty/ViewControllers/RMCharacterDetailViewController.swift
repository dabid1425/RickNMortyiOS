//
//  RMCharacterDetailViewController.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/11/23.
//

import Foundation
import UIKit
class RMCharacterDetailViewController : UIViewController {
    @IBOutlet var characterImageView: UIImageView!
    @IBOutlet var spinner: UIActivityIndicatorView!
    var rmCharacter: RMCharacter!
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
    }
    func configure(rmCharacter: RMCharacter){
        self.rmCharacter = rmCharacter
        title = rmCharacter.name
        if let url = URL(string: rmCharacter.image) {
            RMImageLoader.shared.downloadImage(url, completion: { [weak self] result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
                        self?.spinner.stopAnimating()
                        self?.spinner.alpha = 0
                        let image = UIImage(data: data)
                        self?.characterImageView.image = image
                    }
                case .failure(let error):
                    print(String(describing: error))
                    break
                }
                
            })
        }
    }
}
