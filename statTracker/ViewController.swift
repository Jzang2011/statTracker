//
//  ViewController.swift
//  statTracker
//
//  Created by Jeremy Zang on 2/26/17.
//  Copyright © 2017 Jeremy Zang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var halfFieldImage: UIImageView!
    
    private var _shotList = [UIView]()
    
    private var _shotListWPlayer = [(shotView: UIView, shotByNumber: String, scored: Bool, onGoal: Bool)]()

    var shotListWPlayer: Array<(shotView: UIView, shotByNumber: String, scored: Bool, onGoal: Bool)>{
        get{
            return _shotListWPlayer
        }
        set{
            _shotListWPlayer = newValue
        }
    }
    
    
    var shotList: Array<UIView>{
        get{
            return _shotList
        }
        set{
            _shotList = newValue
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func clearBtnPressed(_ sender: UIButton) {
        //Clear All Shots on screen.
        print(shotList.count)
        
        for shot in shotList {
            shot.removeFromSuperview()
        }
        
        //prints shotList with location of shot, number of player, and if it was a goal.
        for shot in shotListWPlayer {
            print(shot.shotView, shot.shotByNumber, shot.scored, shot.onGoal)
        }
    }
    
    @IBAction func didLongPress(_ sender: UILongPressGestureRecognizer) {
        //Fired when longPress initiated on halfFieldImage
        let location = sender.location(in: view)
        //User commited a long press on the screen. Respond accordingly
        if sender.state == .began {
            print("Long Tap Gesture began")
        } else if sender.state == .changed {
            print("Long Tap Gesture is changing")
        } else if sender.state == .ended {
            print("Long Tap Gesture ended")
        }
        print(location)
        
        
        
        let circle = UIView(frame: CGRect(x: location.x , y: location.y , width: 10.0, height: 10.0))
        circle.layer.cornerRadius = 5
        circle.layer.borderColor = UIColor.purple.cgColor
        circle.layer.borderWidth = 2
        circle.backgroundColor = UIColor.yellow
        circle.clipsToBounds = true
        self.view.addSubview(circle)

        
    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        //Fired when tap has been initiated on halfFieldImage
        let location = sender.location(in: view)
        //User commited a tap on the screen. Respond accordingly
        //Used for debugging and learning purposes. 
        if sender.state == .began {
            print("Tap Gesture began")
        } else if sender.state == .changed {
            print("Tap Gesture is changing")
        } else if sender.state == .ended {
            print("Tap Gesture ended")
        }
        print(location)
        
        let popUpVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ShotPopUpID") as! PopUpViewController
        self.addChildViewController(popUpVC)
        
        //Set reference of viewController in popUpVC
        popUpVC.viewController = self
        //Set Initialshot (initialDot) data point to either be accepted or rejected in popup window
        popUpVC.tempShot = UIView(frame: CGRect(x: location.x , y: location.y , width: 5.0, height: 5.0))
        
        //Used for later as of (3/30/17) Will create a tuple to add to an array for efficient saving of locations of shots to present on other various screens. 
        //Screens: Per Quarter, Per Half, Per Team, Per Player
        popUpVC.currentShotLocationX = location.x
        popUpVC.currentSHotLocationY = location.y

        //sets the frame of the popup to be the same as the main view.
        popUpVC.view.frame = self.view.frame
        self.view.addSubview(popUpVC.view)
        popUpVC.didMove(toParentViewController: self)
        
        //initialDot represents a shot that happend on the field.
        //initialDot is defined bellow
        let dot = popUpVC.tempShot
        
        dot.backgroundColor = UIColor.red
        dot.layer.cornerRadius = 2.5
        dot.layer.borderColor = UIColor.white.cgColor
        dot.layer.borderWidth = 0.25
        dot.clipsToBounds = true
        self.view.addSubview(dot)
    }
}

