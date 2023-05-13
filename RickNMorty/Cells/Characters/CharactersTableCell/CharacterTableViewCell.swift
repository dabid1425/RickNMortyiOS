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
        background.startColor = .clear
        background.endColor = .clear
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        characterName.text = nil
        lastEpSeen.text = nil
        firstEpSeen.text = nil
        characterImageView.labelText = nil
        gender.text = nil
        characterImageView.image = nil
        spinner.startAnimating()
        spinner.alpha = 1
        background.endColor = .clear
        background.startColor = .clear
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
        gender.text = rmCharacter.gender
        rmCharacter.fetchEpisode(episodeName: rmCharacter.firstEpisode) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.firstEpSeen.text = data.name
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
            
        }
        rmCharacter.fetchEpisode(episodeName: rmCharacter.lastEpisode) { [weak self] result in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self?.lastEpSeen.text = data.name
                }
            case .failure(let error):
                print(String(describing: error))
                break
            }
            
        }
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
