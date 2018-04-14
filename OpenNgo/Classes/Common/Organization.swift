//
//  Organization.swift
//  OpenNgo
//
//  Created by Sergey Krutikov on 12.03.2018.
//  Copyright © 2018 Sergey Krutikov. All rights reserved.
//

import Foundation

class OrganizationResponseModel: Codable {
    var count: Int
    var next: String?
    var previous: String?
    var results: [Organization]?
    
    init(count: Int, next: String, previous: String, results: [Organization]) {
        self.count = count
        self.next = next
        self.previous = previous
        self.results = results
    }
}

class Organization: Codable {
    var id: Int
    var region: OrgRegion
    var type: OrgType
    var grants: [OrgGrant]
    var contracts: [OrgContract]
    var subsidies: [OrgSubsidy]
    var name: String
    var active: Bool
    var address: String
    var inn: String
    var kpp: String
    var ogrn: String
    var foundationDate: String?
    var website: String?
    var moneyTransfersSum: Double
    var moneyTransfersSumByType: OrgMoneyTransfersSumByType
    
    enum CodingKeys: String, CodingKey {
        case id, region, type, grants, contracts, subsidies, name, active, address, inn, kpp, ogrn, website
        case foundationDate = "foundation_date", moneyTransfersSum = "money_transfers_sum"
        case moneyTransfersSumByType = "money_transfers_sum_by_type"
    }
    
    init(id: Int, region: OrgRegion, type: OrgType,
         grants: [OrgGrant], contracts: [OrgContract], subsidies: [OrgSubsidy],
         name: String, active: Bool, address: String,
         inn: String, kpp: String, ogrn: String,
         foundationDate: String?, website: String?,
         moneyTransfersSum: Double, moneyTransfersSumByType: OrgMoneyTransfersSumByType) {
        self.id = id
        self.region = region
        self.type = type
        self.grants = grants
        self.contracts = contracts
        self.subsidies = subsidies
        self.name = name
        self.active = active
        self.address = address
        self.inn = inn
        self.kpp = kpp
        self.ogrn = ogrn
        self.foundationDate = foundationDate
        self.website = website
        self.moneyTransfersSum = moneyTransfersSum
        self.moneyTransfersSumByType = moneyTransfersSumByType
    }
    
    class OrgRegion: Codable {
        var name: String
        var code: String
        
        init(name: String, code: String) {
            self.name = name
            self.code = code
        }
    }
    
    class OrgType: Codable {
        var name: String
        var code: String
        
        init(name: String, code: String) {
            self.name = name
            self.code = code
        }
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
        
        init(id: Int, amount: Float, url: String, sourceOfMoney: String,
             date: String, description: String, name: String, receiver: Int) {
            self.id = id
            self.amount = amount
            self.url = url
            self.sourceOfMoney = sourceOfMoney
            self.date = date
            self.description = description
            self.name = name
            self.receiver = receiver
        }
    }
    
    class OrgContract: Codable {
        var id : Int
        var amount: Float
        var name: String?
        var date: String?
        var sourceOfMoney: String?
        var description: [String]
        var receiver: Int
        
        enum CodingKeys: String, CodingKey {
            case id, amount, name, date, description, receiver
            case sourceOfMoney = "source_of_money"
        }
        
        init(id: Int, amount: Float, sourceOfMoney: String?, date: String?,
             description: [String], name: String, receiver: Int) {
            self.id = id
            self.amount = amount
            self.sourceOfMoney = sourceOfMoney
            self.date = date
            self.description = description
            self.name = name
            self.receiver = receiver
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
        
        init(id: Int, amount: Float, sourceOfMoney: String, sourceOfMoneyInn: String,
             sourceOfMoneyKpp: String, name: String, receiver: Int) {
            
            self.id = id
            self.amount = amount
            self.sourceOfMoney = sourceOfMoney
            self.sourceOfMoneyInn = sourceOfMoneyInn
            self.sourceOfMoneyKpp = sourceOfMoneyKpp
            self.name = name
            self.receiver = receiver
        }
        
    }
    
    class OrgMoneyTransfersSumByType: Codable {
        var contract: Double
        var grant: Double
        var subsidy: Double
        
        enum CodingKeys: String, CodingKey {
            case contract = "Contract", grant = "Grant", subsidy = "Subsidy"
        }
        
        init(contract: Double, grant: Double, subsidy: Double) {
            self.contract = contract
            self.grant = grant
            self.subsidy = subsidy
        }
    }
    
}
