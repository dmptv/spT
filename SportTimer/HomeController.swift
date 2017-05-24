//
//  HomeController.swift
//  SportTimer
//
//  Created by Kanat A on 22/05/2017.
//  Copyright © 2017 ak. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout, MCPercentageDoughnutViewDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupCollectionView()
        setupNavBar()
    }

    fileprivate func setupCollectionView() {
        if let flowLayout = collectionView?.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.minimumLineSpacing = 0
            flowLayout.minimumInteritemSpacing = 0
        }
        
        self.collectionView!.register(ProgressBarCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        collectionView?.bounces = false
        collectionView?.showsVerticalScrollIndicator = false
        collectionView?.isPagingEnabled = true
    }
    
    fileprivate func setupNavBar() {
        let setUpBarButtonItem = UIBarButtonItem(title: "Set up", style: .plain, target: self, action: #selector(handleSetUp))
        setUpBarButtonItem.tintColor = UIColor.black
        
        let takeSelfieBarButtonItem = UIBarButtonItem(title: "Selfie", style: .plain, target: self, action: #selector(handleSelfie))
        takeSelfieBarButtonItem.tintColor = UIColor.black
    
        navigationItem.leftBarButtonItem = setUpBarButtonItem
        navigationItem.rightBarButtonItem = takeSelfieBarButtonItem
    }
    
    // MARK: - Handles
    
    func handleSetUp() {
        let layout = UICollectionViewFlowLayout()
        let settingsController = SettingsController(collectionViewLayout: layout)
        navigationController?.pushViewController(settingsController, animated: true)
    }
    
    func handleSelfie() {
        
    }
    
    // MARK: -  UICollectionViewDataSource
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! ProgressBarCell
        
        cell.percentageDoughnut.delegate = self
        
        return cell
    }
    
    
    // MARK: - MCPercentageDoughnutViewDelegate
    
    func didSelect(_ percentageDoughnut: MCPercentageDoughnutView!) {
        print("MCPercentageDoughnutView selected")
    }

    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: view.frame.width, height: view.frame.height - 64)
    }
    
    
    // MARK: UICollectionViewDelegate

    /*

    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
     
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */

}






