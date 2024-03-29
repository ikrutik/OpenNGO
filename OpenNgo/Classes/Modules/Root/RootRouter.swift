//
//  RootRouter.swift
//  OpenNgo
//
//  Created by Sergey Krutikov on 11.03.2018.
//  Copyright © 2018 Sergey Krutikov. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {
    
    func presentMainScreen(in window: UIWindow) {
            window.makeKeyAndVisible()
            window.rootViewController = SearchRouter().assembleModule()
    }
}

