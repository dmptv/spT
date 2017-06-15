//
//  ExpandedCell.swift
//  SportTimer
//
//  Created by Kanat A on 06/06/2017.
//  Copyright © 2017 ak. All rights reserved.
//

import UIKit

class ExpandedCell: UICollectionViewCell {
    
    weak var delegate: CustomCellProtocol?
    
    let soundLabel: UILabel = {
        let label = UILabel()
        label.text = "Sound"
        label.textColor = .white
        return label
    }()
    
    let containerStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        return stackView
    }()
    
    let expandButton: UIButton = {
        let button = UIButton()
        button.tintColor = .blue
        button.setTitle("Sound", for: .normal)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    func setupViews() {
        backgroundColor = .red

        addSubview(containerStackView)
        _ = containerStackView.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: -20, widthConstant: 200, heightConstant: 27)
        containerStackView.centerYAnchor.constraint(equalTo: self.centerYAnchor).isActive = true
        containerStackView.addArrangedSubview(soundLabel)
        containerStackView.addArrangedSubview(expandButton)
        containerStackView.spacing = 30
        
        soundLabel.widthAnchor.constraint(equalTo: expandButton.widthAnchor, multiplier: 1, constant: -70).isActive = true
        
        // сигнял для изменения высоты след ячейки
        expandButton.addTarget(self, action: #selector(handleButtonTouched), for: .touchUpInside)
        
    }
    
    func handleButtonTouched() {
        delegate?.handleExpandCollapsNextCell()
    }


    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}











