//
//  StopWatch.swift
//  SportTimer
//
//  Created by Kanat A on 15/06/2017.
//  Copyright © 2017 ak. All rights reserved.
//

import UIKit

class StopWatch {
    let MAX_SECONDS = 60
    let MAX_MINUTES = 60
    
    var seconds = 0
    var minutes = 0
    var hours = 0
    var initialTime = String(format: "%02i:%02i:%02i", 0, 0, 0)
    
    func increaseTimer(_ timeLabel: UILabel) {
        //  Пошли секунды
        addSecond()
        
        // Пошли минуты
        if (seconds == MAX_SECONDS) {
            seconds = 0
            addMinute()
        }
        
        // Пошли часы
        if (minutes == MAX_MINUTES) {
            minutes = 0
            addHour()
        }
        
        // Выввели время в Label
        timeLabel.text = String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    func resetTime() {
        seconds = 0
        minutes = 0
        hours = 0
    }
    
    private func addSecond() {
        seconds = seconds + 1
    }
    
    private func addMinute() {
        minutes = minutes + 1
    }
    
    private func addHour() {
        hours = hours + 1
    }
}





