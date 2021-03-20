//
//  TransactionsTableViewCell.swift
//  iflux
//
//  Created by Adegoke Ayomikun on 20/03/2021.
//  Copyright © 2021 BGFS. All rights reserved.
//

import UIKit

class TransactionsTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    @IBOutlet weak var txnTypeBg: UIView!
    @IBOutlet weak var txnTypeIcon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    var transaction : Transactions!{
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI(){
        if let txn = transaction {
            nameLabel.text = txn.name
            dateLabel.text = txn.date
            amountLabel.text = txn.amount
            switch txn.type {
            case "inflow":
                txnTypeBg.backgroundColor = UIColor(hexColorCode: "#E0F8EB")
                amountLabel.textColor = UIColor(hexColorCode: "#158046")
                txnTypeIcon.image = UIImage(named: "receive")
            default:
                txnTypeBg.backgroundColor = UIColor(hexColorCode: "#F8DFDF")
                amountLabel.textColor = UIColor(hexColorCode: "#BD2A2A")
                txnTypeIcon.image = UIImage(named: "send")
            }
        }
    }
}
