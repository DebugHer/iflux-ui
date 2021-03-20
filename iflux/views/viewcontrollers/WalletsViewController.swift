//
//  WalletsViewController.swift
//  iflux
//
//  Created by Adegoke Ayomikun on 20/03/2021.
//  Copyright © 2021 BGFS. All rights reserved.
//

import UIKit

class WalletsViewController: UIViewController {
    
    @IBOutlet weak var walletsPageControl: UIPageControl!
    @IBOutlet weak var balancesCollectionView: UICollectionView!
     @IBOutlet weak var cryptoWalletsTableView : UITableView!
    
    var wallets = Wallet.initialiseWallets()
    var cryptoWallets = CryptoWallet.initialiseCryptoWallets()
    
    override func viewWillLayoutSubviews(){
        super.viewWillLayoutSubviews()
        print("Curr \(walletsPageControl.currentPage)")
        let indexPath = IndexPath(item: 1, section: 0)
             self.balancesCollectionView.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        balancesCollectionView.collectionViewLayout = UICollectionViewFlowLayout()
        let screenSize = UIScreen.main.bounds.size
        let cellWidth = floor(screenSize.width * 0.85)
        let cellHeight: CGFloat = 150.0
        let layout = balancesCollectionView!.collectionViewLayout as! UICollectionViewFlowLayout
        layout.scrollDirection = .horizontal
        layout.itemSize = CGSize(width: cellWidth, height: cellHeight)
        balancesCollectionView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 20)
        walletsPageControl.currentPage = 1
        setViewDelegates()
    }
    
    func setViewDelegates(){
        balancesCollectionView.dataSource = self
        balancesCollectionView.delegate = self
        cryptoWalletsTableView.delegate = self
        cryptoWalletsTableView.dataSource = self
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

extension WalletsViewController : UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wallets.count
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
             let cell = balancesCollectionView.dequeueReusableCell(withReuseIdentifier: "BalancesCollectionViewCell", for: indexPath) as! BalancesCollectionViewCell
             let wallet = wallets[indexPath.item]
             cell.wallet = wallet
            return cell
    }
}

extension WalletsViewController : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cryptoWallets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = cryptoWalletsTableView.dequeueReusableCell(withIdentifier: "CryptoWalletsTableViewCell", for: indexPath) as! CryptoWalletsTableViewCell
        let wallet = cryptoWallets[indexPath.row]
        cell.cryptoWallet = wallet
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
    
}
