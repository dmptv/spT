//
//  ButtonCell.swift
//  SportTimer
//
//  Created by Kanat A on 13/06/2017.
//  Copyright © 2017 ak. All rights reserved.
//

import UIKit

class ButtonCell: UICollectionViewCell {
    
    let saveButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 16
        button.setTitle("Save", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .black
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = .clear
        
        addSubview(saveButton)
        _ = saveButton.anchor(top: topAnchor, left: nil, bottom: nil, right: nil, topConstant: 14, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 36)
        saveButton.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
