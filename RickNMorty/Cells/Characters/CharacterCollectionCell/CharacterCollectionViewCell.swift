//
//  CharacterCollectionViewCell.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/10/23.
//

import UIKit

class CharacterCollectionViewCell: UICollectionViewCell {
    static let cellIdentifier = "CharacterCollectionViewCell"
    var rmCharacter: RMCharacter!
    @IBOutlet weak var characterStatus: UILabel!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        characterName.adjustsFontSizeToFitWidth = true
        characterStatus.adjustsFontSizeToFitWidth = true
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        characterName.text = ""
        characterStatus.text = ""
        characterImageView.image = nil
    }
    public func configure(rmCharacter: RMCharacter){
        self.rmCharacter = rmCharacter
        characterName.text = rmCharacter.name
        characterStatus.text = rmCharacter.status.text
        if let url = URL(string: rmCharacter.image) {
            RMImageLoader.shared.downloadImage(url, completion: { [weak self] result in
                switch result {
                case .success(let data):
                    DispatchQueue.main.async {
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
