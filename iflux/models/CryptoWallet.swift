//
//  CryptoWallet.swift
//  iflux
//
//  Created by Adegoke Ayomikun on 20/03/2021.
//  Copyright © 2021 BGFS. All rights reserved.
//

import Foundation
class CryptoWallet{
    var cryptoWalletBalance : String?
    var cryptoWalletName : String?
    var cryptoWalletBgColor : String?
    var cryptoWalletIcon : String?
    
    init(cryptoWalletBalance: String, cryptoWalletName: String, cryptoWalletBgColor: String, cryptoWalletIcon: String) {
        self.cryptoWalletBalance = cryptoWalletBalance
        self.cryptoWalletName = cryptoWalletName
        self.cryptoWalletBgColor = cryptoWalletBgColor
         self.cryptoWalletIcon = cryptoWalletIcon
    }
    
    static func initialiseCryptoWallets() -> [CryptoWallet]{
        return [
            CryptoWallet(cryptoWalletBalance: "0.0032 BTC", cryptoWalletName: "Bitcoin", cryptoWalletBgColor: "#F7931A", cryptoWalletIcon: "btc"),
            
             CryptoWallet(cryptoWalletBalance: "0.450032 ETH", cryptoWalletName: "Ethereum", cryptoWalletBgColor: "#EDF6F7", cryptoWalletIcon: "eth"),
            
             CryptoWallet(cryptoWalletBalance: "0.003232 USDC", cryptoWalletName: "USDC", cryptoWalletBgColor: "#EDF6F7", cryptoWalletIcon: "tron"),
            
             CryptoWallet(cryptoWalletBalance: "0.0032 TRX", cryptoWalletName: "Tron", cryptoWalletBgColor: "#EDF6F7", cryptoWalletIcon: "tron")
        ]
    }
}
