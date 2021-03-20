//
//  ServicesCollectionViewCell.swift
//  iflux
//
//  Created by Adegoke Ayomikun on 20/03/2021.
//  Copyright © 2021 BGFS. All rights reserved.
//

import UIKit

class ServicesCollectionViewCell: UICollectionViewCell {
    
     @IBOutlet weak var serviceNameLabel: UILabel!
     @IBOutlet weak var serviceIcon: UIImageView!
    
    var service : Services!{
        didSet{
            self.updateUI()
        }
    }
    
    func updateUI(){
        if let service = service {
            serviceNameLabel.text = service.serviceName
            serviceIcon.image = UIImage(named: service.serviceIcon)
        }
    }
}
