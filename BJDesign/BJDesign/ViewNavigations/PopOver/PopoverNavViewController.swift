//
//  PopoverNavViewController.swift
//  BJDesign
//
//  Created by Joseph Peter, Gabriel Benny Francis on 4/15/20.
//  Copyright © 2020 Gabby. All rights reserved.
//

import UIKit

class PopoverNavViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func cancelButtonTapped(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
