//
//  TotalTimeCell.swift
//  SportTimer
//
//  Created by Kanat A on 13/06/2017.
//  Copyright © 2017 ak. All rights reserved.
//

import UIKit

class TotalTimeCell: UICollectionViewCell {
    
    let totalTimeLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "5 m : 12 sec"
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 23, weight: UIFontWeightBold)
        return label
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.text = "Total time"
        label.font = UIFont.systemFont(ofSize: 23, weight: UIFontWeightBold)
        label.textColor = .white
        return label
    }()
    
    let totalTimeContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews() {
        addSubview(totalTimeContainerStackView)
        _ = totalTimeContainerStackView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 30, bottomConstant: 0, rightConstant: -30, widthConstant: 0, heightConstant: 0)
        
        totalTimeContainerStackView.distribution = .fillProportionally
        
        totalTimeContainerStackView.addArrangedSubview(nameLabel)
        totalTimeContainerStackView.addArrangedSubview(totalTimeLabel)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}







