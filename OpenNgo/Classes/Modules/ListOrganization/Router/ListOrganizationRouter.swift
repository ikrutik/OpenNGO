//
//  ListOrganizationRouter.swift
//  OpenNgo
//
//  Created by Sergey Krutikov on 11.03.2018.
//  Copyright © 2018 Sergey Krutikov. All rights reserved.
//

import Foundation
import UIKit

class ListOrganizationRouter: ListOrganizationWireframe {
    
        var viewController: UIViewController?
    
        func assembleModule() -> UIViewController {
            let view = listOrgViewControllerFromStoryboard()
            let router = ListOrganizationRouter()
            let navigation = UINavigationController(rootViewController: view)
            
            router.viewController = view
            return navigation
    }
    
    func listOrgViewControllerFromStoryboard() -> UIViewController {
        let storyboard = listOrgStoryboard()
        guard let vc: ListOrganizationViewController = storyboard.instantiateVC() else {
            return ListOrganizationViewController()
        }
        
        return vc
    }
    
    func listOrgStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "ListOrganization", bundle: Bundle.main)
        return storyboard
    }
}
