//
//  SettingsCell.swift
//  SportTimer
//
//  Created by Kanat A on 24/05/2017.
//  Copyright © 2017 ak. All rights reserved.
//

import UIKit

protocol CustomCellProtocol: class {
    func handleExpandCollapsNextCell()
}

class SettingsCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, CustomCellProtocol, UITextFieldDelegate {
    
    let rowsNumber = 9
    let rowOfItemToExpand = 7
    var isShowCell = false
    
    var profileTime: ProfileTime!
    
    fileprivate let infoCellId = "infoCellId"
    fileprivate let totalTimeCellId = "totalTimeCellId"
    fileprivate let expandedCellId = "expandedCell"
    fileprivate let buttonCellId = "buttonCellId"
    
    let settingsCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .clear
        return cv
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        // TO DO - потом при ините тексфилды будут заполняться из Кор Даты
        
        setupViews()
    }
    
    fileprivate func setupViews() {
        
        // Цвет из hex
        backgroundColor = UIColor.hexStringToUIColor(hex: "535187")
        
        settingsCollectionView.dataSource = self
        settingsCollectionView.delegate = self
        
        settingsCollectionView.register(InfoCell.self, forCellWithReuseIdentifier: infoCellId)
        settingsCollectionView.register(TotalTimeCell.self, forCellWithReuseIdentifier: totalTimeCellId)
        settingsCollectionView.register(ExpandedCell.self, forCellWithReuseIdentifier: expandedCellId)
        settingsCollectionView.register(ButtonCell.self, forCellWithReuseIdentifier: buttonCellId)
        
        addSubview(settingsCollectionView)
        _ = settingsCollectionView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, topConstant: 0, leftConstant: 0, bottomConstant: 0, rightConstant: 0, widthConstant: 0, heightConstant: 0)
        
        // Stop edinting all textfileds
        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tapView)))
    }
    
    func tapView() {
        endEditing(true)
    }
    
    
    // MARK: - Habdles
    
    // Save
    func handleSave(button: UIButton) {
        let homeController = HomeController(collectionViewLayout: UICollectionViewFlowLayout())
        HomeController.profileTime = profileTime
        navigationController?.popViewController(homeController, animated: true)
    }
    

    
    //MARK: - UICollectionViewDataSource
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return rowsNumber
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var identifier: String
        
        switch indexPath.item {
        case 0:
            identifier = totalTimeCellId
        case rowOfItemToExpand - 1, rowOfItemToExpand:
            identifier = expandedCellId
        case rowOfItemToExpand + 1:
            identifier = buttonCellId
        default:
            identifier = infoCellId
        }
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        
        setUpElementsOfRow(identifier: identifier, cell: cell, indexPath: indexPath)
        
        return cell
    }
    
    func setUpElementsOfRow(identifier: String, cell: UICollectionViewCell, indexPath: IndexPath) {
        if identifier == totalTimeCellId {
            let cell = cell as! TotalTimeCell
            
            // TO DO: - create func to count total time
            cell.totalTimeLabel.text = "0m:0sec"
            
            //  var meters: Double = 10
            //  let text = "Моя длина \(meters * 3.28) фута"
        }

        // TO DO: - перенести это в класс ячейки , а здесь вызвать функцию у cell
        if identifier == infoCellId {
            let cell = cell as! InfoCell
            cell.secondsTextField.text = "0"
            cell.secondsTextField.delegate = self
            
            switch indexPath.item {
            case 1:
                cell.nameLabel.text = "Round"
                cell.secondsTextField.tag = 1
            case 2:
                cell.nameLabel.text = "Rest"
                cell.secondsTextField.tag = 2
            case 3:
                cell.nameLabel.text = "Warm Up"
                cell.secondsTextField.tag = 3
            case 4:
                cell.nameLabel.text = "Cool Down"
                cell.secondsTextField.tag = 4
            case 5:
                cell.nameLabel.text = "Number"
                cell.secondsTextField.tag = 5
            default:
                break
            }
        }
        
        if identifier == buttonCellId {
            let cell = cell as! ButtonCell
            cell.saveButton.addTarget(self, action: #selector(handleSave), for: .touchUpInside)
        }
        
        if identifier == expandedCellId {
            let cell = cell as! ExpandedCell
            cell.delegate = self
        }
        
        // Hide cell under expanded
        if indexPath.item == rowOfItemToExpand && !isShowCell {
            cell.isHidden = true
        }
    }


    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    //MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath:
        IndexPath) -> CGSize {
        
        // Меняем высоту expanded cell
        if indexPath.item == rowOfItemToExpand && isShowCell {
            return CGSize(width: frame.width - 28, height: 150)
        } else if indexPath.item == rowOfItemToExpand && !isShowCell {
            return CGSize(width: frame.width - 28, height: 0)
        }
        
        return CGSize(width: frame.width - 28, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsetsMake(0, 14, 0, 14)
    }
    
    //MARK: - UITextFieldDelegate
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // TO DO - сделать валидацию строк - чтобы сюда заходили только цифры и не больше 600
        
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        profileTime = ProfileTime()
        
        if let timeText = textField.text {
            switch textField.tag {
            case 1:
                profileTime.round = timeText
            case 2:
                profileTime.rest = timeText
            case 3:
                profileTime.warmUp = timeText
            case 4:
                profileTime.coolDown = timeText
            case 5:
                profileTime.number = timeText
            default:
                break
            }
        }
        
        print((profileTime.round * profileTime.number) + (profileTime.rest * (profileTime.number - 1)) + profileTime.coolDown + profileTime.warmUp)
    }
    
    func castFromStringToInt(str: String) -> CGFloat {
        return CGFloat((str as NSString).floatValue)
    }
    
    //MARK: - ExpandCellProtocol
    func handleExpandCollapsNextCell() {
        
        // Меняем флаг и reloadItems - установится новая height
        isShowCell = !isShowCell
        
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseInOut, animations: {
            self.settingsCollectionView.reloadItems(at: [IndexPath(item: self.rowOfItemToExpand, section: 0)])
            self.settingsCollectionView.reloadData()
        }) { (bool) in
            self.settingsCollectionView.scrollToItem(at: IndexPath(item: self.rowsNumber - 1, section: 0), at: [], animated: true)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


















