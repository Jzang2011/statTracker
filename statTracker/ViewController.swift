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
        //        circle.layer.cornerRadius = 50
        circle.backgroundColor = UIColor.yellow
        circle.clipsToBounds = true
        self.view.addSubview(circle)

        
    }
    
    @IBAction func didTap(_ sender: UITapGestureRecognizer) {
        //Fired when tap has been initiated on halfFieldImage
        let location = sender.location(in: view)
        //User commited a tap on the screen. Respond accordingly
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
        
        popUpVC.viewController = self
        popUpVC.currentShotLocationX = location.x
        popUpVC.currentSHotLocationY = location.y
        popUpVC.inititalShot = UIView(frame: CGRect(x: location.x , y: location.y , width: 5.0, height: 5.0))

        popUpVC.view.frame = self.view.frame
        self.view.addSubview(popUpVC.view)
        popUpVC.didMove(toParentViewController: self)
        
//        let initialDot = UIView(frame: CGRect(x: location.x , y: location.y , width: 5.0, height: 5.0))
////        circle.layer.cornerRadius = 50
//        initialDot.backgroundColor = UIColor.red
//        initialDot.clipsToBounds = true
//        self.view.addSubview(initialDot)
        
        let initialDot = popUpVC.inititalShot
        initialDot.backgroundColor = UIColor.red
        initialDot.clipsToBounds = true
        self.view.addSubview(initialDot)
    }
}

