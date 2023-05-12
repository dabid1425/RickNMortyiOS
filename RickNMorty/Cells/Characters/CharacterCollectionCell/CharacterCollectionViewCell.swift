//
//  CharacterCollectionViewCell.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/10/23.
//

import UIKit
import Material

class CharacterCollectionViewCell: UICollectionViewCell {
    @IBOutlet var background: GradientBorderShadowView!
    static let cellIdentifier = "CharacterCollectionViewCell"
    @IBOutlet var spinner: UIActivityIndicatorView!
    var rmCharacter: RMCharacter!
    @IBOutlet var characterName: UILabel!
    @IBOutlet var characterImageView: CurvedLabelImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        characterName.adjustsFontSizeToFitWidth = true

        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        characterName.text = ""
        characterImageView.image = nil
        spinner.startAnimating()
        spinner.alpha = 1
        characterImageView.labelText = ""
        characterImageView.labelTextColor = .clear
        background.startColor = .clear
        background.endColor = .clear
    }
    
    public func configure(rmCharacter: RMCharacter){
        self.rmCharacter = rmCharacter
        characterName.text = rmCharacter.name
        spinner.startAnimating()
        characterImageView.labelText = rmCharacter.status.text
        characterImageView.labelTextColor = rmCharacter.status == .dead ? .red : .green
        characterImageView.borderColor = rmCharacter.status == .dead ? .red : .green
        background.startColor = rmCharacter.status == .dead ? .purple : .systemTeal
        background.endColor = rmCharacter.status == .dead ? .red : .green
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
