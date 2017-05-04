//
//  PopUpViewController.swift
//  statTracker
//
//  Created by Jeremy Zang on 3/30/17.
//  Copyright © 2017 Jeremy Zang. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController, UITextFieldDelegate {

    private var _currentShotLocationX: CGFloat!
    private var _currentShotLocationY: CGFloat!
    
    private var _viewController: HalfFieldVC!
    
    @IBOutlet weak var popUpView: UIView!
    @IBOutlet weak var shotOnGoalSwitch: UISwitch!
    @IBOutlet weak var goalScoredSwitch: UISwitch!
    @IBOutlet weak var playerNumberTextField: UITextField!
    @IBOutlet weak var manUp: UISwitch!
    
    private var _tempShot: UIView!
    
    var halfFieldVC: HalfFieldVC {
        get {
            return _viewController
        }
        set {
            _viewController = newValue
        }
    }
    
    var tempShot: UIView {
        get {
            return _tempShot
        }
        set {
            _tempShot = newValue
        }
    }

    var currentShotLocationX: CGFloat {
        get {
            return _currentShotLocationX
        }
        set {
            _currentShotLocationX = newValue
        }
    }
    
    var currentSHotLocationY: CGFloat {
        get {
            return _currentShotLocationY
        }
        set {
            _currentShotLocationY = newValue
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        popUpView.layer.cornerRadius = 5

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.showAnimate()
        
        self.playerNumberTextField.delegate = self
        goalScoredSwitch.setOn(false, animated: true)
        
        playerNumberTextField.returnKeyType = UIReturnKeyType.done
        playerNumberTextField.becomeFirstResponder()
        playerNumberTextField.keyboardType = .numberPad
    }
    
    @IBAction func goalScoredSwitchTouched(_ sender: UISwitch) {
        shotOnGoalSwitch.setOn(true, animated: true)
        if goalScoredSwitch.isOn {
            _tempShot.backgroundColor = UIColor.green
        } else {
            _tempShot.backgroundColor = UIColor.red
        }
    }
    
    @IBAction func shotOnGoalSwitchTouched(_ sender: UISwitch) {
        goalScoredSwitch.setOn(false, animated: true)
    }
    
    @IBAction func manUpSwitchPressed(_ sender: UISwitch) {
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }

    @IBAction func closePressed(_ sender: UIButton) {
        tempShot.removeFromSuperview()
        self.removeAnimate()
    }
    
    @IBAction func acceptPressed(_ sender: UIButton) {
        
        let shot: (shotView: UIView, shotByNumber: String, scored: Bool, onGoal: Bool) = (_tempShot, playerNumberTextField.text ?? "", goalScoredSwitch.isOn, shotOnGoalSwitch.isOn)
        
        halfFieldVC.shotListWPlayer.append(shot)
        halfFieldVC.shotList.append(_tempShot)
        self.removeAnimate()
        //TODO: Add shot location and player number to some list
    }

    func showAnimate()
    {
        self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        self.view.alpha = 0.0;
        UIView.animate(withDuration: 0.25, animations: {
            self.view.alpha = 1.0
            self.view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
        });
    }
    
    func removeAnimate()
    {
        UIView.animate(withDuration: 0.25, animations: {
            self.view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
            self.view.alpha = 0.0;
        }, completion:{(finished : Bool)  in
            if (finished)
            {
                self.view.removeFromSuperview()
            }
        });
    }
    
}
