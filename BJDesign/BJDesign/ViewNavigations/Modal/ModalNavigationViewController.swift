//
//  ModalNavigationViewController.swift
//  BJDesign
//
//  Created by Joseph Peter, Gabriel Benny Francis on 4/15/20.
//  Copyright © 2020 Gabby. All rights reserved.
//

import UIKit

class ModalNavigationViewController: UIViewController {
    @IBOutlet weak var lblItem: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblItem.text = "Modal view"
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
