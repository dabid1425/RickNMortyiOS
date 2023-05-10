//
//  CharacterTableViewCell.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/10/23.
//

import UIKit

class CharacterTableViewCell: UITableViewCell {
    static let cellIdentifier = "CharacterTableViewCell"
    var rmCharacter: RMCharacter!
    @IBOutlet var lastEpSeen: UILabel!
    @IBOutlet var firstEpSeen: UILabel!
    @IBOutlet var gender: UILabel!
    @IBOutlet var status: UILabel!
    @IBOutlet var characterName: UILabel!
    @IBOutlet var characterImageView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    public func setData(rmCharacter: RMCharacter){
        self.rmCharacter = rmCharacter
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
