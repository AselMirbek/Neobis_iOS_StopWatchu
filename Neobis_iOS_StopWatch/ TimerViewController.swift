//
//  StopWatchViewController.swift
//  Neobis_iOS_StopWatch
//
//  Created by Interlink on 29/10/23.
//
import UIKit

class TimerViewController: MainUiViewController {
   /* @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var stopButton: UIButton!
    @IBOutlet weak var pauseButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var segmentedCotroller: UISegmentedControl!8*/
   
    
    var timer: Timer?
    var isRunning = false
    var startTime: TimeInterval = 0
    var remainingTime: TimeInterval = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        timerPicker.countDownDuration = 60.0 // Начальное значение таймера (1 минута)
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
            startTime = Date().timeIntervalSinceReferenceDate - remainingTime
        }
    }

    @IBAction override func pauseButtonTapped(_ sender: UIButton) {
        if isRunning {
            startButton.isEnabled = true
            pauseButton.isEnabled = false
            stopButton.isEnabled = true

            timer?.fireDate = Date.distantFuture
        }
    }

    @IBAction override func stopButtonTapped(_ sender: UIButton) {
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

    @objc private func updateTime() {
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


