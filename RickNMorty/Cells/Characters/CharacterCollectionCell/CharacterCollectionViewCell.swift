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
    var rmCharacter: RMCharacterViewCellModel!
    @IBOutlet var characterName: UILabel!
    @IBOutlet var characterImageView: CurvedLabelImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        characterName.adjustsFontSizeToFitWidth = true
        background.startColor = .clear
        background.endColor = .clear
        
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
    
    public func configure(rmCharacter: RMCharacterViewCellModel){
        self.rmCharacter = rmCharacter
        characterName.text = rmCharacter.name
        spinner.startAnimating()
        characterImageView.labelText = rmCharacter.characterStatusText
        characterImageView.labelTextColor = rmCharacter.labelTextColor
        characterImageView.borderColor = rmCharacter.borderColor
        background.startColor = rmCharacter.gradientStartColor
        background.endColor = rmCharacter.gradientEndColor
        rmCharacter.fetchImage { [weak self] result in
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
        }
    }
}
