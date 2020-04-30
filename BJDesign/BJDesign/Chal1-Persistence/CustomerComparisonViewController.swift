//
//  CustomerComparisonViewController.swift
//  BJDesign
//
//  Created by Joseph Peter, Gabriel Benny Francis on 4/17/20.
//  Copyright © 2020 Gabby. All rights reserved.
//

import UIKit

enum SelectedCustomer: Int {
    case SelectedCustomer1 = 0
    case SelectedCustomer2
}

class CustomerComparisonViewController: UIViewController {
    @IBOutlet weak var resultsTextView: UITextView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var btnSignMeUp: UIButton!
    @IBOutlet weak var txtFieldFirstName: UITextField!
    @IBOutlet weak var txtFieldLastName: UITextField!
    @IBOutlet weak var txtFieldNickName: UITextField!
    @IBOutlet weak var txtFieldAddress: UITextField!
    @IBOutlet weak var btnCompareCustomers: UIButton!
    
    var selectedCustomerProfile = SelectedCustomer.SelectedCustomer1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(textFieldDidChangeAction(_:)), name: UITextField.textDidChangeNotification, object: nil)
        selectedCustomerProfile = segmentControl.selectedSegmentIndex == 0 ? SelectedCustomer.SelectedCustomer1 : SelectedCustomer.SelectedCustomer2
        btnSignMeUp.isEnabled = false
    }
    
    @objc func textFieldDidChangeAction(_ notification: NSNotification) {
        let textField = notification.object as? UITextField
        guard let textFieldText = textField?.text else {
            return
        }

        if (textField == txtFieldFirstName) && textFieldText.count > 0 {
            btnSignMeUp.isEnabled = true
        }
    }
    
    @IBAction func segmentControlTapped(_ sender: UISegmentedControl) {
        selectedCustomerProfile = sender.selectedSegmentIndex == 0 ? SelectedCustomer.SelectedCustomer1 : SelectedCustomer.SelectedCustomer2
    }
    
    @IBAction func signMeUpTapped(_ sender: UIButton) {
        var customerDetails: [String: String] = [:]
        
        if let firstName = txtFieldFirstName.text {
            customerDetails.updateValue(firstName, forKey: "FirstName")
        }
        
        if let lastName = txtFieldLastName.text {
            customerDetails.updateValue(lastName, forKey: "LastName")
        }
        
        if let nickName = txtFieldNickName.text {
            customerDetails.updateValue(nickName, forKey: "NickName")
        }
        
        if let address = txtFieldAddress.text {
            customerDetails.updateValue(address, forKey: "Address")
        }
        
        if selectedCustomerProfile == SelectedCustomer.SelectedCustomer1 {
            UserDefaults.standard.set(customerDetails, forKey: "Customer1Profile")
            UserDefaults.standard.synchronize()
        }
        else {
            UserDefaults.standard.set(customerDetails, forKey: "Customer2Profile")
            UserDefaults.standard.synchronize()
        }
        
        txtFieldFirstName.text = ""
        txtFieldLastName.text = ""
        txtFieldNickName.text = ""
        txtFieldAddress.text = ""
    }
    
    @IBAction func compareCustomersTapped(_ sender: UIButton) {
        guard let customer1Data = UserDefaults.standard.value(forKey: "Customer1Profile") as? [String: String] else {
            return
        }
        
        guard let customer2Data = UserDefaults.standard.value(forKey: "Customer2Profile") as? [String: String] else {
            return
        }
        
        if (customer1Data["FirstName"] == customer2Data["FirstName"]) && (customer1Data["Address"] == customer2Data["Address"]) {
            resultsTextView.text = "they are equal"
        }
        else {
            resultsTextView.text = "they are not equal"
        }
    }
}

extension CustomerComparisonViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
