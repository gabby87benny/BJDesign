//
//  RootTableViewCell.swift
//  BJDesign
//
//  Created by Joseph Peter, Gabriel Benny Francis on 4/8/20.
//  Copyright © 2020 Gabby. All rights reserved.
//

import UIKit

class RootTableViewCell: UITableViewCell {

    @IBOutlet weak var lblDesignItem: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func configureCell() {
        lblDesignItem.text = "some str"
    }

}
