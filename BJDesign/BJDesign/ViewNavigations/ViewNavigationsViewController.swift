//
//  ViewNavigationsViewController.swift
//  BJDesign
//
//  Created by Joseph Peter, Gabriel Benny Francis on 4/10/20.
//  Copyright © 2020 Gabby. All rights reserved.
//

import UIKit

class ViewNavigationsViewController: UIViewController {
    struct ViewNavigationsViewControllerConstants {
        static let viewNavigationsTableViewIdentifier = "viewNavigationsTableViewCellIdentifier"
        static let showPushNavigationVCVCIdentifier = "showPushNavVCIdentifier"
    }

    @IBOutlet weak var tableView: UITableView!
    var items: [NavigationItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        items = [
            NavigationItem(name: "Push navigation", controllerName: "PushNavigationViewController")
        ]
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let selectedCell = sender as? UITableViewCell, let selectedRowIndex = tableView.indexPath(for: selectedCell)?.row, segue.identifier == ViewNavigationsViewControllerConstants.showPushNavigationVCVCIdentifier else {
            fatalError("sender is not a UITableViewCell or was not found in the tableView, or segue.identifier is incorrect")
        }
        let item = items[selectedRowIndex]
        let pushNavController = segue.destination as! PushNavigationViewController
        pushNavController.item = item
    }
}

extension ViewNavigationsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ViewNavigationsViewControllerConstants.viewNavigationsTableViewIdentifier, for: indexPath)
        let item = items[indexPath.row]
        cell.textLabel?.text = item.name
        return cell
    }
}

