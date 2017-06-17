//
//  HomeController.swift
//  SportTimer
//
//  Created by Kanat A on 22/05/2017.
//  Copyright © 2017 ak. All rights reserved.
//

import UIKit

// протокол для включения, выключения таймера
protocol ProgressBarCellDelegate: class {
    func handelStartAction(sender: MCPercentageDoughnutView, button: UIButton)
    func handleResetAction(sender: MCPercentageDoughnutView, button: UIButton)
}

private let reuseIdentifier = "Cell"

class HomeController: UICollectionViewController, UICollectionViewDelegateFlowLayout, MCPercentageDoughnutViewDelegate, ProgressBarCellDelegate {
    
    
    var persentageView: MCPercentageDoughnutView?
    var timer = Timer()
    var startStopButton: UIButton!
    var timeToTimer: CGFloat = 60.0
    
    let notificationName = Notification.Name(rawValue: profileTimeChanged)
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    var profileTime: ProfileTime? {
        didSet {
            print(" home vc now equals == \(String(describing: profileTime))")
        }
    }
     
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupNavBar()
        
        createObserver()
    }
    
    func createObserver() {
        NotificationCenter.default.addObserver(self, selector: #selector(updateProfileTime(notification:)), name: notificationName, object: profileTime)
    }
    
    func updateProfileTime(notification: NSNotification) {
        profileTime = notification.object as? ProfileTime
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
        setUpBarButtonItem.tintColor = .white
        
        let takeSelfieBarButtonItem = UIBarButtonItem(title: "Selfie", style: .plain, target: self, action: #selector(handleSelfie))
        takeSelfieBarButtonItem.tintColor = .white
        
        navigationItem.leftBarButtonItem = setUpBarButtonItem
        navigationItem.rightBarButtonItem = takeSelfieBarButtonItem
        
        let backItem = UIBarButtonItem()
        backItem.title = "Main"
        navigationItem.backBarButtonItem = backItem
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        title = "Time to Go"
    }
    
    // MARK: - ProgressBarCellDelegate
    
    // Start timer
    func handelStartAction(sender: MCPercentageDoughnutView, button: UIButton) {
        persentageView = sender
        startStopButton = button
        
        if let buttonTitle = button.titleLabel?.text {
            if buttonTitle == "Start" {
                timer = Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(timerUpdate), userInfo: Date(), repeats: true);
                button.setTitle("Stop", for: UIControlState())
            } else {
                timer.invalidate()
                button.setTitle("Start", for: UIControlState())
            }
        }
    }
    
    func timerUpdate() {
        // Oтсчитываем интревал с момента запуска
        let elapsed = -(timer.userInfo as! Date).timeIntervalSinceNow
        let str = String(format: "%.0f", elapsed)
        let floatTime = castFromStringToInt(str: str) / 100
        
        // выводим отсчет в progresse bar
        if floatTime <= CGFloat(timeToTimer) {
            persentageView?.percentage = floatTime
        } else {
            handleResetAction(sender: persentageView!, button: startStopButton)
        }
    }
    
    // Reset
    func handleResetAction(sender: MCPercentageDoughnutView, button: UIButton) {
        // TO DO:  - show AlertController 
        persentageView?.percentage = 0.0
        timer.invalidate()
        startStopButton.setTitle("Start", for: UIControlState())
    }
    
    // TO DO - функция для приведения вида из строки в CfFloat
    func castFromStringToInt(str: String) -> CGFloat {
        return CGFloat((str as NSString).floatValue)
    }
    
    // Переходим в Settings
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
        cell.delegate = self
        
        return cell
    }
    
    
    // MARK: - MCPercentageDoughnutViewDelegate
    func didSelect(_ percentageDoughnut: MCPercentageDoughnutView!) {
        
        // TO DO: - при тапе внутри прогрес юара - останавливать его
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






