//
//  BalancesCollectionViewCell.swift
//  iflux
//
//  Created by Adegoke Ayomikun on 20/03/2021.
//  Copyright © 2021 BGFS. All rights reserved.
//

import UIKit

class BalancesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var balanceCellBackgroundView: UIView!
    
    @IBOutlet weak var walletBalanceLabel: UILabel!
    @IBOutlet weak var walletTypeLabel: UILabel!
    
    var wallet : Wallet!{
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI(){
        if let wallet = wallet {
            walletBalanceLabel.text = wallet.walletBalance
            walletTypeLabel.text = wallet.walletName
            balanceCellBackgroundView.backgroundColor = UIColor.init(hexColorCode: wallet.walletBgColor)
        }
    }
}
