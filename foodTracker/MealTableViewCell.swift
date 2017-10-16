//
//  MealTableViewCell.swift
//  foodTracker
//
//  Created by Robert Kuraj on 16.10.2017.
//  Copyright © 2017 Robert Kuraj. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {
    
    //MARK: Properties
    @IBOutlet weak var mealNameLabel: UILabel!
    @IBOutlet weak var mealPhoto: UIImageView!
    @IBOutlet weak var mealRating: ratingControl!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
