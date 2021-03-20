//
//  Transactions.swift
//  iflux
//
//  Created by Adegoke Ayomikun on 20/03/2021.
//  Copyright © 2021 BGFS. All rights reserved.
//

import Foundation
class Transactions{
    var name : String?
    var date: String?
    var amount : String?
    var type: String?
    
    init(name: String, date: String, amount: String, type: String) {
        self.name = name
        self.date = date
        self.amount = amount
        self.type = type
    }
    
    static func initialiseTransactions() -> [Transactions]{
        return [
            Transactions(name: "Adegoke Ayomikun", date: "11, Sept 2020", amount: "$1,000", type: "inflow"),
            Transactions(name: "Jon Bosco", date: "11, Oct 2020", amount: "$2,343", type: "outflow"),
            Transactions(name: "Ayokunle John", date: "21, January 2020", amount: "$100", type: "outflow")
        ]
    }
}
