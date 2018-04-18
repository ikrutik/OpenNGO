//
//  ListOrganizationWireframe.swift
//  OpenNgo
//
//  Created by Sergey Krutikov on 11.03.2018.
//  Copyright © 2018 Sergey Krutikov. All rights reserved.
//

import Foundation
import UIKit

protocol ListOrganizationWireframe: class {
    var viewController: UIViewController? { get set }

    func assembleModule(organization: [Organization]) -> ListOrganizationViewController
}
