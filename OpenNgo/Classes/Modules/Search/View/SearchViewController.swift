//
//  MainViewController.swift
//  OpenNgo
//
//  Created by Sergey Krutikov on 13.04.2018.
//  Copyright © 2018 Sergey Krutikov. All rights reserved.
//

import Foundation
import UIKit
import Alamofire
import RxSwift

class SearchOrganizationViewController: UIViewController {
    let disposeBag = DisposeBag()
    let typeSegmentedControls: [String] = ["string_search", "inn", "ogrn"]
    var typeRequest = "string_search"
    
    var router: SearchRouter!
    @IBOutlet private weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func typeRequestChanged(_ sender: UISegmentedControl) {
        let index = sender.selectedSegmentIndex
        switch index {
            case 0: self.setTextSearchTxtField(text: "Введите название организации")
            case 1: self.setTextSearchTxtField(text: "Введите номер ИНН")
            case 2: self.setTextSearchTxtField(text: "Введите номер ОГРН")
            default: break
        }
        
        self.typeRequest = typeSegmentedControls[index]
    }
    
    
    @IBAction private func clickSearchBtn(_ sender: UIButton) {
        let params: [String: Any] = [typeRequest: searchTextField.text!]
        self.getOrganizations(params: params)
    }
    
    private func setTextSearchTxtField(text: String) {
        DispatchQueue.main.async {
            self.searchTextField.placeholder = text
        }
    }
    
    func getOrganizations(params: Parameters) {
        Alamofire.request(URL).rx.responseJSON()
            .map({ try! jsonDecoder.decode(OrganizationResponseModel.self, from: $0 )})
            .subscribe(
                onNext: { self.router.showOrganizations(orgs: $0.results!) },
                onError: { print($0)})
            .disposed(by: disposeBag)
    }
    
}



