//
//  DetailTableViewController.swift
//  challange01
//
//  Created by Maria Luiza Carvalho Sperotto on 05/10/19.
//  Copyright © 2019 Maria Luiza Carvalho Sperotto. All rights reserved.
//

import UIKit

class DetailTableViewController: UITableViewController {
    
    
    @IBOutlet weak var bandImageView: UIImageView!
    @IBOutlet weak var bandDescriptionLabel: UILabel!
    @IBOutlet weak var bandNameLabel: UILabel!
    
    
    var band: Band?
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.separatorStyle = .none
        
        bandImageView.image = band?.image2
        bandNameLabel.text = band?.name
        bandDescriptionLabel.text = band?.description
    }
    
}
