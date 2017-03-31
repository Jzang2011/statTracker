//
//  PopUpViewController.swift
//  statTracker
//
//  Created by Jeremy Zang on 3/30/17.
//  Copyright © 2017 Jeremy Zang. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    private var _currentShotLocationX: CGFloat!
    private var _currentShotLocationY: CGFloat!
    
    private var _viewController: ViewController!
    
    private var _initialShot: UIView!
    
    var viewController: ViewController {
        get {
            return _viewController
        }
        set {
            _viewController = newValue
        }
    }
    
    var inititalShot: UIView {
        get {
            return _initialShot
        }
        set {
            _initialShot = newValue
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

        self.view.backgroundColor = UIColor.black.withAlphaComponent(0.6)
        self.showAnimate()
    }

    @IBAction func closePressed(_ sender: UIButton) {
        inititalShot.removeFromSuperview()
        self.removeAnimate()
    }
    
    @IBAction func acceptPressed(_ sender: UIButton) {
        viewController.shotList.append(_initialShot)
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
