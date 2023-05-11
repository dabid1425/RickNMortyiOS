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
    static let cellIdentifier = "CharacterTableViewCell"
    var rmCharacter: RMCharacter!
    @IBOutlet var spinner: UIActivityIndicatorView!
    @IBOutlet var lastEpSeen: UILabel!
    @IBOutlet var firstEpSeen: UILabel!
    @IBOutlet var gender: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var characterName: UILabel!
    @IBOutlet var characterImageView: UIImageView!
    public weak var delegate: RMCharacterItemSelectedDelegate?
    override func awakeFromNib() {
        super.awakeFromNib()
        characterName.adjustsFontSizeToFitWidth = true
        lastEpSeen.adjustsFontSizeToFitWidth = true
        firstEpSeen.adjustsFontSizeToFitWidth = true
        status.adjustsFontSizeToFitWidth = true
        gender.adjustsFontSizeToFitWidth = true
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        characterName.text = ""
        lastEpSeen.text = ""
        firstEpSeen.text = ""
        status.text = ""
        gender.text = ""
        characterImageView.image = nil
        spinner.startAnimating()
        spinner.alpha = 1
    }
    public func configure(rmCharacter: RMCharacter){
        self.rmCharacter = rmCharacter
        
        characterName.text = rmCharacter.name
        spinner.startAnimating()
        lastEpSeen.text = rmCharacter.episode[rmCharacter.episode.count - 1]
        firstEpSeen.text = rmCharacter.episode[0]
        status.text = rmCharacter.status.text
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
