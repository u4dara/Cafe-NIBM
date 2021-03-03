//
//  FoodTableViewCell.swift
//  NIBM-CAFE
//
//  Created by Udara Sachinthana on 2021-03-03.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
