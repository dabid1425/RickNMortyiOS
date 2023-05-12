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
    var rmCharacter: RMCharacter!
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
        characterName.text = ""
        lastEpSeen.text = ""
        firstEpSeen.text = ""
        characterImageView.labelText = ""
        gender.text = ""
        characterImageView.image = nil
        spinner.startAnimating()
        spinner.alpha = 1
        background.endColor = .clear
        background.startColor = .clear
    }
    public func configure(rmCharacter: RMCharacter){
        self.rmCharacter = rmCharacter
        
        characterName.text = rmCharacter.name
        spinner.startAnimating()
        lastEpSeen.text = rmCharacter.episode[rmCharacter.episode.count - 1]
        firstEpSeen.text = rmCharacter.episode[0]
        characterImageView.labelText = rmCharacter.status.text
        characterImageView.labelTextColor = rmCharacter.status == .dead ? .red : .green
        characterImageView.borderColor = rmCharacter.status == .dead ? .red : .green
        background.startColor = rmCharacter.status == .dead ? .purple : .systemTeal
        background.endColor = rmCharacter.status == .dead ? .red : .green
        gender.text = rmCharacter.gender.rawValue
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
