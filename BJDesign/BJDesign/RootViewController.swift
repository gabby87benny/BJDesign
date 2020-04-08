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

class RootViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

extension RootViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: RootViewControllerConstants.rootTableViewIdentifier, for: indexPath) as? RootTableViewCell else {
            print("Issue")
            return UITableViewCell()
        }
        cell.configureCell()
        return cell
    }
}

extension RootViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
