//
//  ViewController.swift
//  OpenNgo
//
//  Created by Sergey Krutikov on 11.03.2018.
//  Copyright © 2018 Sergey Krutikov. All rights reserved.
//

import UIKit
import Alamofire

class ListOrganizationViewController: UIViewController {

    @IBOutlet weak var organizationTableView: UITableView!
    let heightCell: CGFloat = 170
    var organizations: [Organization] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.initTableView()
    }
    
    func initTableView() {
        self.organizationTableView.delegate = self
        self.organizationTableView.dataSource = self
        self.organizationTableView.rowHeight = UITableViewAutomaticDimension
        self.organizationTableView.estimatedRowHeight = heightCell
        self.organizationTableView.reloadData()
    }
}

extension ListOrganizationViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return heightCell
    }
}

extension ListOrganizationViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.organizations.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: ListOrganizationCell = tableView.dequeueReusableCell(for: indexPath)
        let organization = self.organizations[indexPath.row]
        cell.setOrganization(organization: organization)
        return cell
    }
    
}

