//
//  ViewController.swift
//  Neobis_iOS_StopWatch
//
//  Created by Asel Mirbek on 24/10/23.
//

import UIKit

class MainUiViewController: UIViewController {
   @IBOutlet weak var timerLabel: UILabel!
     @IBOutlet weak var stopButton: UIButton!
     @IBOutlet weak var pauseButton: UIButton!
     @IBOutlet weak var startButton: UIButton!
     @IBOutlet weak var segmentedCotroller: UISegmentedControl!
     @IBOutlet weak var timerPicker: UIDatePicker!
     
   // var timer: Timer!
    let   timerView = TimerViewController()
    let stopwatchView = StopWatchViewController()
    override func viewDidLoad() {
          super.viewDidLoad()
         setupChildViewControllers()
       // timer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(UpdateTime), userInfo: nil, repeats: true) // Repeat "func Update() " every second and update the l
    }
    
    private func setupChildViewControllers() {
        
        addChild(timerView)
        addChild(stopwatchView)
        self.view.addSubview(timerView.view)
        self.view.addSubview(stopwatchView.view)
        timerView.didMove(toParent: self)
        stopwatchView.didMove(toParent: self)
        timerView.view.frame = self.view.bounds
        stopwatchView.view.frame = self.view.bounds
        stopwatchView.view.isHidden = true  }
     
     @IBAction func segmentedControlValueChanged(segment: UISegmentedControl) {
         timerView.view.isHidden = true
         stopwatchView.view.isHidden = true
         if segment.selectedSegmentIndex == 0{
             timerView.view.isHidden = false
             timerPicker.isHidden = false
         }
         else {
             stopwatchView.view.isHidden = false
             timerPicker.isHidden = true
         }
     }
    @IBAction func startButtonTapped(_ sender: UIButton) {
            if segmentedCotroller.selectedSegmentIndex == 0 {
                // Выбран сегмент для таймера, выполните логику для таймера
                timerView.startButtonTapped(sender)
            } else {
                // Выбран сегмент для секундомера, выполните логику для секундомера
                stopwatchView.startButtonTapped(sender)
            }
        }
    @IBAction func stopButtonTapped(_ sender: UIButton) {
            if segmentedCotroller.selectedSegmentIndex == 0 {
                // Выбран сегмент для таймера, выполните логику для таймера
                timerView.stopButtonTapped(sender)
            } else {
                // Выбран сегмент для секундомера, выполните логику для секундомера
                stopwatchView.stopButtonTapped(sender)
            }
        }
    @IBAction func pauseButtonTapped(_ sender: UIButton) {
            if segmentedCotroller.selectedSegmentIndex == 0 {
                // Выбран сегмент для таймера, выполните логику для таймера
                timerView.pauseButtonTapped(sender)
            } else {
                // Выбран сегмент для секундомера, выполните логику для секундомера
                stopwatchView.pauseButtonTapped(sender)
            }
        }
    
    /*@objc func UpdateTime() {
        let userCalendar = Calendar.current
        // Set Current Date
        let date = Date()
        let components = userCalendar.dateComponents([.hour, .minute, .month, .year, .day, .second], from: date)
        let currentDate = userCalendar.date(from: components)!
        
        // Set Event Date
        var eventDateComponents = DateComponents()
        eventDateComponents.year = 2020
        eventDateComponents.month = 01
        eventDateComponents.day = 01
        eventDateComponents.hour = 00
        eventDateComponents.minute = 00
        eventDateComponents.second = 00
        eventDateComponents.timeZone = TimeZone(abbreviation: "GMT")
        
        // Convert eventDateComponents to the user's calendar
        let eventDate = userCalendar.date(from: eventDateComponents)!
        
        // Change the seconds to days, hours, minutes and seconds
        let timeLeft = userCalendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: eventDate)
        
        // Display Countdown
        timerLabel.text = "\(timeLeft.day!)d \(timeLeft.hour!)h \(timeLeft.minute!)m \(timeLeft.second!)s"
        
        
        
        
        
        
    }*/
}

