//
//  RootViewController.swift
//  BJDesign
//
//  Created by Joseph Peter, Gabriel Benny Francis on 4/7/20.
//  Copyright © 2020 Gabby. All rights reserved.
//

import UIKit

struct RootViewControllerConstants {
    static let rootTableViewIdentifier = "RootTableViewCellIdentifier"
}

struct Item {
    let name: String
    let controllerName: String
}

class RootViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var items: [Item] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        items = [
            Item(name: "View navigations", controllerName: "ViewNavigationsViewController")
        ]
    }
}

extension RootViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RootViewControllerConstants.rootTableViewIdentifier, for: indexPath) as? RootTableViewCell else {
            print("Issue in creating cell")
            return UITableViewCell()
        }
        cell.configureCell(item: items[indexPath.row])
        return cell
    }
}

extension RootViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = items[indexPath.row]
        let storyboardRef = UIStoryboard(name: item.controllerName, bundle: nil)
        if let initialVC = storyboardRef.instantiateInitialViewController() {
            self.navigationController?.pushViewController(initialVC, animated: true)
        }
    }
}
