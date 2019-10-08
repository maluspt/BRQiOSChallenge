//
//  BandTableViewCell.swift
//  challange01
//
//  Created by Maria Luiza Carvalho Sperotto on 05/10/19.
//  Copyright © 2019 Maria Luiza Carvalho Sperotto. All rights reserved.
//

import UIKit

class BandTableViewCell: UITableViewCell {

    @IBOutlet weak var bandImageView: UIImageView!
    @IBOutlet weak var bandNameLabel: UILabel!
    
    
    var band: Band? {
        didSet {
            updateUI()
        }
    }
    
    func updateUI() {
        
        bandImageView.image = band?.image
        bandImageView.layer.cornerRadius = 8
        bandImageView.layer.masksToBounds = true
        bandNameLabel.text = band?.name
}

}
