//
//  MainViewController.swift
//  OpenNgo
//
//  Created by Sergey Krutikov on 13.04.2018.
//  Copyright © 2018 Sergey Krutikov. All rights reserved.
//

import Foundation
import UIKit

class SearchOrganizationViewController: UIViewController {
    @IBOutlet private weak var SearchTextField: UITextField!
    
    let service = NetworkService()
    
    @IBAction private func clickSearchBtn(_ sender: UIButton) {
        let params: [String: Any] = ["string_search": SearchTextField.text!]
        service.getOrganizations(params: params)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}



