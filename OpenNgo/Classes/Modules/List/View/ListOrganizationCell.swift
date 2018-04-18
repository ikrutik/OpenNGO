//
//  ListOrganizationCell.swift
//  OpenNgo
//
//  Created by Sergey Krutikov on 18.04.2018.
//  Copyright © 2018 Sergey Krutikov. All rights reserved.
//

import UIKit

class ListOrganizationCell: UITableViewCell {
    
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var region: UILabel!
    @IBOutlet weak var amount: UILabel!
    @IBOutlet weak var type: UILabel!
    
    func setOrganization(organization: Organization) {
        self.name.text = organization.name
        self.region.text = organization.region.name
        self.amount.text = "\(organization.moneyTransfersSum)"
        self.type.text = organization.type.name
    }
}

extension ListOrganizationCell: DequeuableProtocol {}
