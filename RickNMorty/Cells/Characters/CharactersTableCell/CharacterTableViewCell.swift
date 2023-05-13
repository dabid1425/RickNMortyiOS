//
//  CharacterTableViewCell.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/10/23.
//

import UIKit

protocol RMCharacterItemSelectedDelegate: AnyObject {
    func didLoadInitialCharacters()
    
}

class CharacterTableViewCell: UITableViewCell {
    @IBOutlet var background: GradientBorderShadowView!
    static let cellIdentifier = "CharacterTableViewCell"
    var rmCharacter: RMCharacterViewCellModel!
    @IBOutlet var spinner: UIActivityIndicatorView!
    @IBOutlet var lastEpSeen: UILabel!
    @IBOutlet var firstEpSeen: UILabel!
    @IBOutlet var gender: UILabel!
    @IBOutlet var characterName: UILabel!
    @IBOutlet var characterImageView: CurvedLabelImageView!
    public weak var delegate: RMCharacterItemSelectedDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        characterName.adjustsFontSizeToFitWidth = true
        lastEpSeen.adjustsFontSizeToFitWidth = true
        firstEpSeen.adjustsFontSizeToFitWidth = true
        gender.adjustsFontSizeToFitWidth = true
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        characterName.text = nil
        lastEpSeen.text = nil
        firstEpSeen.text = nil
        characterImageView.labelText = nil
        gender.text = ""
        characterImageView.image = nil
        spinner.startAnimating()
        spinner.alpha = 1
        background.endColor = .clear
        background.startColor = .clear
    }
    public func configure(rmCharacter: RMCharacterViewCellModel){
        self.rmCharacter = rmCharacter
        characterName.text = rmCharacter.name
        spinner.startAnimating()
        lastEpSeen.text = rmCharacter.getCharacter().episode[rmCharacter.getCharacter().episode.count - 1]
        firstEpSeen.text = rmCharacter.getCharacter().episode[0]
        characterImageView.labelText = rmCharacter.getCharacter().status.text
        characterImageView.labelTextColor = rmCharacter.characterStatus == .dead ? .red : .green
        characterImageView.borderColor = rmCharacter.characterStatus == .dead ? .red : .green
        background.startColor = rmCharacter.characterStatus == .dead ? .systemPurple : .systemTeal
        background.endColor = rmCharacter.characterStatus == .dead ? .systemRed : .systemGreen
        gender.text = rmCharacter.gender
        print("\(rmCharacter.name) , \(rmCharacter.characterStatus) : \(background.startColor) ,\(background.endColor)")
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
