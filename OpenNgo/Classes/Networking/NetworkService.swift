//
//  NetworkService.swift
//  OpenNgo
//
//  Created by Sergey Krutikov on 13.04.2018.
//  Copyright © 2018 Sergey Krutikov. All rights reserved.
//

import Foundation
import Alamofire
import RxSwift

let jsonDecoder = JSONDecoder()
let URL = "https://openngo.ru/api/organizations/"

extension Request: ReactiveCompatible {}

extension Reactive where Base: DataRequest {
    
    func responseJSON() -> Observable<Data> {
        return Observable.create { observer in
            let request = self.base.responseJSON { response in
                switch response.result {
                case .success(_):
                    observer.onNext(response.data!)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create(with: request.cancel)
        }
    }
}

protocol NetworkService {
    func getOrganizations(params: Parameters) -> Observable<[OrganizationResponseModel]>
}
