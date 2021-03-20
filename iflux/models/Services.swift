//
//  Services.swift
//  iflux
//
//  Created by Adegoke Ayomikun on 20/03/2021.
//  Copyright © 2021 BGFS. All rights reserved.
//

import Foundation
class Services{
    var serviceName = ""
    var serviceIcon = ""
    
    init(serviceName: String, serviceIcon: String) {
        self.serviceName = serviceName
        self.serviceIcon = serviceIcon
    }
    
    static func initialiseServices() -> [Services]{
        return [
            Services(serviceName: "Add Money", serviceIcon: "addicon"),
            Services(serviceName: "Send Money", serviceIcon: "transfericon"),
            Services(serviceName: "Withdraw", serviceIcon: "withdrawicon"),
            Services(serviceName: "Request Money", serviceIcon: "moneyicon"),
        ]
    }
}
