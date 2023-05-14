//
//  LocationTableViewCell.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/13/23.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    @IBOutlet var dimensionLabel: UILabel!
    @IBOutlet var typeName: UILabel!
    @IBOutlet var locationName: UILabel!
    static let cellIdentifier = "RMLocationTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        dimensionLabel.adjustsFontSizeToFitWidth = true
        typeName.adjustsFontSizeToFitWidth = true
        locationName.adjustsFontSizeToFitWidth = true
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        dimensionLabel.text = nil
        typeName.text = nil
        locationName.text = nil
    }
    func configure(rmLocationCellModel: RMLocationViewCellModel){
        locationName.text = rmLocationCellModel.name
        typeName.text = rmLocationCellModel.type
        dimensionLabel.text = rmLocationCellModel.dimension
    }
    
}
