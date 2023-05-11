//
//  CharacterCollectionViewCell.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/10/23.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    @IBOutlet var mainView: UIView!
    static let cellIdentifier = "CharacterCollectionViewCell"
    @IBOutlet var spinner: UIActivityIndicatorView!
    var rmCharacter: RMCharacter!
    @IBOutlet var characterStatus: UILabel!
    @IBOutlet var characterName: UILabel!
    @IBOutlet var characterImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        characterName.adjustsFontSizeToFitWidth = true
        characterStatus.adjustsFontSizeToFitWidth = true
        setUpLayer()
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        characterName.text = ""
        characterStatus.text = ""
        characterImageView.image = nil
        spinner.startAnimating()
        spinner.alpha = 1
    }
    private func setUpLayer() {
        mainView.layer.cornerRadius = 8
        mainView.layer.shadowColor = UIColor.label.cgColor
        mainView.layer.cornerRadius = 4
        mainView.layer.shadowOffset = CGSize(width: -4, height: 4)
        mainView.layer.shadowOpacity = 0.3
    }
    public func configure(rmCharacter: RMCharacter){
        self.rmCharacter = rmCharacter
        characterName.text = rmCharacter.name
        spinner.startAnimating()
        characterStatus.text = rmCharacter.status.text
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
