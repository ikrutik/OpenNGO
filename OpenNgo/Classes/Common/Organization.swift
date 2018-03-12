//
//  Organization.swift
//  OpenNgo
//
//  Created by Sergey Krutikov on 12.03.2018.
//  Copyright © 2018 Sergey Krutikov. All rights reserved.
//

import Foundation

class Organization: Codable {
    var id: Int
    var region: OrgRegion
    var type: OrgType
    var grants: OrgGrant
    var contracts: [OrgContract]
    var subsidies: [OrgSubsidy]
    var name: String
    var active: Bool
    var address: String
    var inn: String
    var kpp: String
    var ogrn: String
    var foundationDate: String
    var website: String?
    var moneyTransfersSum: Float
    var moneyTransfersSumByType: OrgMoneyTransfersSumByType
    
    enum CodingKeys: String, CodingKey {
        case id, region, type, grants, contracts, subsidies, name, active, address, inn, kpp, ogrn, website
        case foundationDate = "foundation_date", moneyTransfersSum = "money_transfers_sum"
        case moneyTransfersSumByType = "money_transfers_sum_by_type"
    }
    
    class OrgRegion: Codable {
        var name: String
        var code: Int
    }
    
    class OrgType: Codable {
        var name: String
        var code: Int
    }
    
    class OrgGrant: Codable {
        var id : Int
        var amount: Float
        var url: String
        var date: String
        var sourceOfMoney: String
        var name: String
        var description: String
        var receiver: Int
        
        enum CodingKeys: String, CodingKey {
            case id, amount, url, date, name, description, receiver
            case sourceOfMoney = "source_of_money"
        }
    }
    
    class OrgContract: Codable {
        var id : Int
        var amount: Float
        var name: String
        var date: String
        var sourceOfMoney: String
        var description: String
        var receiver: Int
        
        enum CodingKeys: String, CodingKey {
            case id, amount, name, date, description, receiver
            case sourceOfMoney = "source_of_money"
        }
    }
    
    class OrgSubsidy: Codable {
        var id : Int
        var amount: Float
        var sourceOfMoney: String
        var sourceOfMoneyInn: String
        var sourceOfMoneyKpp: String
        var name: String
        var receiver: Int
        
        enum CodingKeys: String, CodingKey {
            case id, amount, name, receiver
            case sourceOfMoney = "source_of_money"
            case sourceOfMoneyInn = "source_of_money_inn"
            case sourceOfMoneyKpp = "source_of_money_kpp"
        }
    }
    
    class OrgMoneyTransfersSumByType: Codable {
        var contract: Float
        var grant: Float
        var subsidy: Float
        
        enum CodingKeys: String, CodingKey {
            case contract = "Contract", grant = "Grant", subsidy = "Subsidy"
        }
    }

}
