//
//  Wallet.swift
//  iflux
//
//  Created by Adegoke Ayomikun on 20/03/2021.
//  Copyright © 2021 BGFS. All rights reserved.
//

import Foundation

class Wallet{
    var walletBalance = ""
    var walletName = ""
    var walletBgColor = ""
    
    init(walletBalance: String, walletName: String, walletBgColor: String) {
        self.walletBalance = walletBalance
        self.walletName = walletName
        self.walletBgColor = walletBgColor
    }
    
    static func initialiseWallets() -> [Wallet]{
        return [
            Wallet(walletBalance: "NGN 1,200,432", walletName: "Flux Wallet", walletBgColor: "#212858"),
            Wallet(walletBalance: "NGN 3,349,344", walletName: "Crypto Wallet", walletBgColor: "#415356")
        ]
    }
}
