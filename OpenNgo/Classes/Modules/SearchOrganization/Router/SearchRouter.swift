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

    
    
    var viewController: UIViewController?
    
    func assembleModule() -> UIViewController {
        let view = searchControllerFromStoryboard()
        let router = SearchRouter()
        let navigation = UINavigationController(rootViewController: view)
        
        router.viewController = view
        return navigation
    }
    
    func showOrganizations() -> ListOrganizationViewController {
        return ListOrganizationViewController()
    }
    
    func searchControllerFromStoryboard() -> UIViewController {
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
