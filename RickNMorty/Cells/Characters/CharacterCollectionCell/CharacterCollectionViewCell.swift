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
    public weak var delegate: RMCharacterItemSelectedDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        characterName.adjustsFontSizeToFitWidth = true
        background.startColor = .clear
        background.endColor = .clear
        background.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
    }
    
    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        delegate?.didSelectItem(rmCharacter: rmCharacter.getCharacter())
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
        background.gradientEndPoint = CGPoint(x: 0, y: 0)
        background.gradientStartPoint = CGPoint(x: 0, y: 0)
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
        background.gradientEndPoint = CGPoint(x: 0, y: 0.5)
        background.gradientStartPoint = CGPoint(x: 0.5, y: 0)
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
