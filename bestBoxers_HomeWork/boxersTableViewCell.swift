//
//  boxersTableViewCell.swift
//  bestBoxers_HomeWork
//
//  Created by Bekzat on 25/11/24.
//

import UIKit
import SDWebImage

class boxersTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var birthDateLabel: UILabel!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var photoImageView: UIImageView!
    
    @IBOutlet weak var countryFlagImaveView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.layer.cornerRadius = 16
        countryFlagImaveView.layer.cornerRadius = 21
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(boxer: bestBoxer) {
        
        nameLabel.text = boxer.name
        birthDateLabel.text = boxer.birthDate
        titleLabel.text = boxer.title
        
        photoImageView.sd_setImage(with: URL(string:boxer.photo))
        countryFlagImaveView.sd_setImage(with: URL(string:boxer.country))
       
        
    }

}
