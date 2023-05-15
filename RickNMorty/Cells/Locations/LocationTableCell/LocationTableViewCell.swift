//
//  LocationTableViewCell.swift
//  RickNMorty
//
//  Created by Dan Abid on 5/13/23.
//

import UIKit

class LocationTableViewCell: UITableViewCell {
    @IBOutlet var background: UIView!
    @IBOutlet var dimensionLabel: UILabel!
    @IBOutlet var typeName: UILabel!
    @IBOutlet var locationName: UILabel!
    static let cellIdentifier = "RMLocationTableViewCell"
    var rmLocationCellModel: RMLocationViewCellModel!
    weak var delegate: LocationModelDelegate!
    override func awakeFromNib() {
        super.awakeFromNib()
        dimensionLabel.adjustsFontSizeToFitWidth = true
        typeName.adjustsFontSizeToFitWidth = true
        locationName.adjustsFontSizeToFitWidth = true
        background.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_:))))
        }

    @objc func imageTapped(_ sender: UITapGestureRecognizer) {
        delegate?.didSelectItem(rmLocation: rmLocationCellModel.getLocation())
        }
    override func prepareForReuse() {
        super.prepareForReuse()
        dimensionLabel.text = nil
        typeName.text = nil
        locationName.text = nil
    }
    func configure(rmLocationCellModel: RMLocationViewCellModel){
        self.rmLocationCellModel = rmLocationCellModel
        locationName.text = rmLocationCellModel.name
        typeName.text = rmLocationCellModel.type
        dimensionLabel.text = rmLocationCellModel.dimension
    }
    
}
