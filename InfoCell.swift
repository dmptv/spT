//
//  InfoCell.swift
//  SportTimer
//
//  Created by Kanat A on 28/05/2017.
//  Copyright © 2017 ak. All rights reserved.
//

import UIKit

class InfoCell: UICollectionViewCell {
        
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        return label
    }()
    
    let secondsContainerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = .yellow // #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
        return stackView
    }()
    
    let secondsTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.keyboardType = .numberPad
        tf.returnKeyType = .done
        tf.borderStyle = .none
        return tf
    }()
    
    let secondsNameLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = .clear
        label.text = "Sec"
        label.textColor = .white
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
                
        setupViews()
    }
    
    fileprivate func setupViews() {
        addSubview(nameLabel)
        _ = nameLabel.anchor(top: nil, left: leftAnchor, bottom: nil, right: nil, topConstant: 0, leftConstant: 20, bottomConstant: 0, rightConstant: 0, widthConstant: 100, heightConstant: 20)
        nameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        
        addSubview(secondsContainerStackView)
        _ = secondsContainerStackView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: -20, widthConstant: 100, heightConstant: 20)
        secondsContainerStackView.centerYAnchor.constraint(equalTo: nameLabel.centerYAnchor).isActive = true
        
        secondsContainerStackView.addArrangedSubview(secondsTextField)
        secondsContainerStackView.addArrangedSubview(secondsNameLabel)
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}





















