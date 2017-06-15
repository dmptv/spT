//
//  ProgressBarCell.swift
//  SportTimer
//
//  Created by Kanat A on 23/05/2017.
//  Copyright © 2017 ak. All rights reserved.
//

import UIKit

class ProgressBarCell: UICollectionViewCell {

    var rightConstant: CGFloat = 0.0
    weak var delegate: ProgressBarCellDelegate?

    let timeContainerView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .lightGray
        view.layer.cornerRadius = 12
        view.layer.masksToBounds = true
        return view
    }()
    
    let timeTextLabel: UILabel = {
        let label = UILabel()
        label.text = "Round Start in"
        label.textAlignment = .center
        label.backgroundColor = .green
        label.font = .boldSystemFont(ofSize: 20)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.textAlignment = .center
        label.font = .boldSystemFont(ofSize: 20)
        label.backgroundColor = .green
        return label
    }()
    
    let profileLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.text = "Profile name"
        label.font = .boldSystemFont(ofSize: 23)
        label.textAlignment = .center
        return label
    }()
    
    let percentageDoughnut: MCPercentageDoughnutView = {
        let view = MCPercentageDoughnutView(frame: .zero)
        view.initialPercentage = 0.0
        view.showTextLabel = true
        view.textLabel.text = "Percentage"
        return view
    }()
    
    let startButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 16
        button.setTitle("Start", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .black
        return button
    }()
    
    let resetButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.layer.cornerRadius = 16
        button.setTitle("Reset", for: .normal)
        button.setTitleColor(UIColor.white, for: .normal)
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.backgroundColor = .black
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
  
        backgroundColor = .orange
        
        addSubview(percentageDoughnut)
        addSubview(profileLabel)
        addSubview(timeContainerView)
        addSubview(startButton)
        addSubview(resetButton)
        
        rightConstant = frame.width / 4
        
        _ = profileLabel.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: self.rightAnchor, topConstant: 8, leftConstant: 40, bottomConstant: 0, rightConstant: -40, widthConstant: 0, heightConstant: 30)
        
        // timer
        _ = timeContainerView.anchor(top: profileLabel.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 40, bottomConstant: 0, rightConstant: -40, widthConstant: 0, heightConstant: 24)
        
        timeContainerView.addSubview(timeTextLabel)
        _ = timeTextLabel.anchor(top: timeContainerView.topAnchor, left: timeContainerView.leftAnchor, bottom: timeContainerView.bottomAnchor, right: timeContainerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: -rightConstant, widthConstant: 0, heightConstant: 0)
        
        timeContainerView.addSubview(timeLabel)
        _ = timeLabel.anchor(top: timeContainerView.topAnchor, left: timeTextLabel.rightAnchor, bottom: timeContainerView.bottomAnchor, right: timeContainerView.rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        // circular progress bar
        _ = percentageDoughnut.anchor(top: timeContainerView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, topConstant: 16, leftConstant: 16, bottomConstant: 0, rightConstant: -16, widthConstant: 0, heightConstant: frame.width - 32)
   
        // start reset buttons
        _ = startButton.anchor(top: percentageDoughnut.bottomAnchor, left: timeContainerView.leftAnchor, bottom: nil, right: nil, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: rightConstant, heightConstant: 32)
        
        _ = resetButton.anchor(top: percentageDoughnut.bottomAnchor, left: nil, bottom: nil, right: timeContainerView.rightAnchor, topConstant: 16, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: rightConstant, heightConstant: 32)
        
        // Старт и ресет таймера
        startButton.addTarget(self, action: #selector(handleStart), for: .touchUpInside)
        resetButton.addTarget(self, action: #selector(handleReset), for: .touchUpInside)
    }
    
    func handleStart(button: UIButton) {
        delegate?.handelStartAction(sender: percentageDoughnut, button: button)
    }
    
    func handleReset(button: UIButton) {
        delegate?.handleResetAction(sender: percentageDoughnut, button: button)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}












