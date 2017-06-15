//
//  SettingsController.swift
//  SportTimer
//
//  Created by Kanat A on 24/05/2017.
//  Copyright © 2017 ak. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class SettingsController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.collectionView!.register(SettingsCell.self, forCellWithReuseIdentifier: reuseIdentifier)
                
        setupCollectionView()
    }
        
    func setupCollectionView() {
        
    }

    // MARK: UICollectionViewDataSource

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! SettingsCell
        
        return cell
    }
    
    
    // MARK: - UICollectionViewDelegateFlowLayout
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {

        return CGSize(width: view.frame.width, height: view.frame.height - 64)
    }
    
 
    
}


























