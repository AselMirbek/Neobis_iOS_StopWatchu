//
//  StopWatchViewController.swift
//  Neobis_iOS_StopWatch
//
//  Created by Interlink on 30/10/23.
//

import UIKit

class StopWatchViewController: MainUiViewController {
    private var timer: Timer?
    private var isRunning = false
    private var startTime: TimeInterval = 0
    private var remainingTime: TimeInterval = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timerPicker.countDownDuration = 60.0 // Set the initial time on the DatePicker
    }
    
    
    @IBAction override func startButtonTapped(_ sender: UIButton) {
        if !isRunning {
            startButton.isEnabled = false
            pauseButton.isEnabled = true
            stopButton.isEnabled = true

            if timer == nil {
                remainingTime = timerPicker.countDownDuration
                timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
                RunLoop.current.add(timer!, forMode: .common)
            } else {
                // Возобновить таймер
                timer?.fireDate = Date()
            }

            isRunning = true
            startTime = Date().timeIntervalSinceReferenceDate - startTime
        }
    }

    @IBAction override func  pauseButtonTapped(_ sender: UIButton) {
        if isRunning {
            startButton.isEnabled = true
            pauseButton.isEnabled = false
            stopButton.isEnabled = true

            timer?.fireDate = Date.distantFuture
        }
    }

    @IBAction override func   stopButtonTapped(_ sender: UIButton) {
        startButton.isEnabled = true
        pauseButton.isEnabled = false
        stopButton.isEnabled = false

        if let timer = timer {
            timer.invalidate()
        }

        isRunning = false
        remainingTime = 0
        updateTime()
    }

   @objc private  func updateTime() {
       let _ = Date().timeIntervalSinceReferenceDate - startTime


        if remainingTime > 0 {
            remainingTime -= 1
            let minutes = Int(remainingTime) / 60
            let seconds = Int(remainingTime) % 60
            timerLabel.text = String(format: "%02d:%02d", minutes, seconds)
        } else {
            if let timer = timer {
                timer.invalidate()
            }

            isRunning = false
            timerLabel.text = "00:00"
        }
    }
}
