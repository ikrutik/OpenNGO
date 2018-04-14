//
//  NetworkService.swift
//  OpenNgo
//
//  Created by Sergey Krutikov on 13.04.2018.
//  Copyright © 2018 Sergey Krutikov. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    let jsonDecoder = JSONDecoder()
    let URL = "https://openngo.ru/api/organizations/"
    
    func getOrganizations(params: Parameters) {
        Alamofire.request(URL, method: .get, parameters: params).responseJSON(completionHandler: { (response) in
            let result = try! self.jsonDecoder.decode(OrganizationResponseModel.self, from: response.data!)
            print(result.results)
        })
    }
}
