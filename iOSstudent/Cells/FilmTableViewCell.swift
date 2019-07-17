//
//  StuTableViewCell.swift
//  iOSstudent
//
//  Created by Loord dinsan on 02/05/2019.
//  Copyright © 2019 Loord dinsan. All rights reserved.
//

import UIKit

class StuTableViewCell: UITableViewCell {

    @IBOutlet weak var stuimg: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var releaseYearLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        stuimg.layer.borderWidth = 0.5
        stuimg.layer.masksToBounds = false
        stuimg.layer.borderColor = UIColor.darkGray.cgColor
        stuimg.layer.masksToBounds = true
        stuimg.layer.cornerRadius = stuimg.bounds.width / 2
        
     
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        //super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        if selected {
            self.backgroundColor = .gray
        } else {
            self.backgroundColor = .white
        }
    }

}
