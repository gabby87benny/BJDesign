//
//  PushNavigationViewController.swift
//  BJDesign
//
//  Created by Joseph Peter, Gabriel Benny Francis on 4/15/20.
//  Copyright © 2020 Gabby. All rights reserved.
//

import UIKit

class PushNavigationViewController: UIViewController {
    @IBOutlet weak var lblItem: UILabel!
    var item: NavigationItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        lblItem.text = item.name
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        switch segue.identifier {
        case "presentModalNavControllerId":
            guard let navController = segue.destination as? UINavigationController, let modalNav = navController.topViewController as? ModalNavigationViewController else {
                fatalError("Unexpected view hierarchy")
            }
            modalNav.title = "Modal Page Presented"
            
        case "presentPopoverNavControllerId":
            guard let navController = segue.destination as? UINavigationController, let popoverNav = navController.topViewController as? PopoverNavViewController else {
                fatalError("Unexpected view hierarchy")
            }
            popoverNav.title = "Popover Page Presented"
            
        default:
            fatalError("Unhandled Segue: \(segue.identifier!)")
            
        }
    }
}
