//
//  CryptoWalletsTableViewCell.swift
//  iflux
//
//  Created by Adegoke Ayomikun on 20/03/2021.
//  Copyright © 2021 BGFS. All rights reserved.
//

import UIKit

class CryptoWalletsTableViewCell: UITableViewCell {
    @IBOutlet weak var cryptoWalletNameLabel: UILabel!
    @IBOutlet weak var cryptoWalletBalanceLabel: UILabel!
    @IBOutlet weak var cryptoWalletBg: UIView!
    @IBOutlet weak var cryptoWalletIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20))
    }
    
    var cryptoWallet : CryptoWallet!{
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI(){
        if let cryptoWallet = cryptoWallet {
            cryptoWalletNameLabel.text = cryptoWallet.cryptoWalletName
            cryptoWalletBalanceLabel.text = cryptoWallet.cryptoWalletBalance
            cryptoWalletBg.backgroundColor = UIColor(hexColorCode: cryptoWallet.cryptoWalletBgColor!)
            cryptoWalletIcon.image = UIImage(named: cryptoWallet.cryptoWalletIcon!)
        }
    }
}
