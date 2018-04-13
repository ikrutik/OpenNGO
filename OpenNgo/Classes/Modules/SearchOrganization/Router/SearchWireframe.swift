//
//  SearchWireframe.swift
//  OpenNgo
//
//  Created by Sergey Krutikov on 13.04.2018.
//  Copyright © 2018 Sergey Krutikov. All rights reserved.
//

import Foundation
import UIKit

protocol SearchWireframe: class {
    weak var viewController: UIViewController? { get set }
    
    func assembleModule() -> UIViewController
    func showOrganizations() -> ListOrganizationViewController

}
