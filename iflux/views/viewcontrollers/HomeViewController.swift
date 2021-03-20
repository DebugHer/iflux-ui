//
//  ViewController.swift
//  iflux
//
//  Created by Adegoke Ayomikun on 20/03/2021.
//  Copyright © 2021 BGFS. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var txnsTableView: UITableView!
    @IBOutlet weak var walletsPageControl: UIPageControl!
    @IBOutlet weak var balancesCollectionView: UICollectionView!
    @IBOutlet weak var servicesCollectionView: UICollectionView!
    
    var wallets = Wallet.initialiseWallets()
    var services = Services.initialiseServices()
    var transactions = Transactions.initialiseTransactions()
    var cellScale : CGFloat = 0.85
    
    override func viewDidLoad() {
        super.viewDidLoad()
        walletsPageControl.numberOfPages = 2
        balancesCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        servicesCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * cellScale)
        let cellHeight: CGFloat = 150.0
        let serviceCellWidth : CGFloat = 100.0
        let serviceCellHeight : CGFloat = 100.0
        
        let layout = balancesCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        
        let serviceLayout = servicesCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        serviceLayout.scrollDirection = .horizontal
        serviceLayout.itemSize = CGSize(width: serviceCellWidth, height: serviceCellHeight)
        balancesCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        setViewDelegates()
    }
    
    func setViewDelegates(){
        balancesCollectionView.dataSource = self
        servicesCollectionView.dataSource = self
        txnsTableView.dataSource = self
        txnsTableView.delegate = self
        balancesCollectionView.delegate = self
        servicesCollectionView.delegate = self
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        switch scrollView.tag {
        case 0:
            let offset = scrollView.contentOffset.x
            let width = scrollView.frame.width
            let horizontalCenter = width / 2
            walletsPageControl.currentPage = Int(offset + horizontalCenter) / Int(width)
        default:
            print()
        }
        
    }
}

extension HomeViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch collectionView.tag {
        case 0:
            return wallets.count
        default:
            return services.count
        }
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        switch collectionView.tag {
        case 0:
            let cell = balancesCollectionView.dequeueReusableCell(withReuseIdentifier: "BalancesCollectionViewCell", for: indexPath) as! BalancesCollectionViewCell
            let wallet = wallets[indexPath.item]
            cell.wallet = wallet
            return cell
        default:
            let cell = servicesCollectionView.dequeueReusableCell(withReuseIdentifier: "ServicesCollectionViewCell", for: indexPath) as! ServicesCollectionViewCell
            let service = services[indexPath.item]
            cell.service = service
            return cell
        }
    }
}

extension HomeViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return transactions.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = txnsTableView.dequeueReusableCell(withIdentifier: "TransactionsTableViewCell", for: indexPath) as! TransactionsTableViewCell
        let transaction = transactions[indexPath.row]
        cell.transaction = transaction
        return cell
    }
}


