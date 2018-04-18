//
//  SearchRouter.swift
//  OpenNgo
//
//  Created by Sergey Krutikov on 13.04.2018.
//  Copyright © 2018 Sergey Krutikov. All rights reserved.
//

import Foundation
import UIKit

class SearchRouter: SearchWireframe {
    weak var viewController: UIViewController?
    
    func assembleModule() -> UIViewController {
        let router = SearchRouter()
        let view = searchControllerFromStoryboard()
        view.router = router
        router.viewController = view
        
        self.viewController = UINavigationController(rootViewController: view)
        return viewController!
    }
    
    func showOrganizations(orgs: [Organization]) {
        let listVC = ListOrganizationRouter().assembleModule(organization: orgs)
        listVC.organizations = orgs
        self.viewController?.navigationController?.pushViewController(listVC, animated: true)
    }
    
    func searchControllerFromStoryboard() -> SearchOrganizationViewController {
        let storyboard = getSearchStoryboard()
        guard let vc: SearchOrganizationViewController = storyboard.instantiateVC() else {
            return SearchOrganizationViewController()
        }
        
        return vc
    }
    
    func getSearchStoryboard() -> UIStoryboard {
        let storyboard = UIStoryboard(name: "Search", bundle: Bundle.main)
        return storyboard
    }
}
