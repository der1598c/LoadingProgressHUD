//
//  ViewController.swift
//  LoadingProgressHUD
//
//  Created by der1598c on 07/20/2019.
//  Copyright (c) 2019 der1598c. All rights reserved.
//

import UIKit
import LoadingProgressHUD

class ViewController : UIViewController {
    
    @IBOutlet weak var controlView: UIView!
    @IBOutlet weak var popActivityButton: UIButton!
    
    private var progress: CGFloat = 0.0
    
    private var activityCount = 0 {
        didSet {
            popActivityButton.setTitle("popActivity - \(activityCount)", for: .normal)
        }
    }
    
    // MARK: - ViewController lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        activityCount = 0
        //        LoadingProgressHUD.setHUD(backgroundColor: UIColor.blue)
        addObserver(self, forKeyPath: "activityCount", options: .new, context: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.handle(_:)), name: NotificationName.LoadingProgressHUDWillAppear.getNotificationName(), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.handle(_:)), name: NotificationName.LoadingProgressHUDDidAppear.getNotificationName(), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.handle(_:)), name: NotificationName.LoadingProgressHUDWillDisappear.getNotificationName(), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.handle(_:)), name: NotificationName.LoadingProgressHUDDidAppear.getNotificationName(), object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.handle(_:)), name: NotificationName.LoadingProgressHUDDidReceiveTouchEvent.getNotificationName(), object: nil)
        
        addObserver(self as NSObject, forKeyPath: "activityCount", options: .new, context: nil)
    }
    
    @IBAction func show(_ sender: UIButton) {
        DispatchQueue.global(qos: .utility).async {
            LoadingProgressHUD.show()
        }
        self.activityCount += 1
    }
    
    @IBAction func showWithStatus(_ sender: UIButton) {
        activityCount += 1
        LoadingProgressHUD.show(withStatus: "Show with Status")
        activityCount += 1
    }
    
    @IBAction func showWithProgress(_ sender: UIButton) {
        activityCount += 1
        progress = 0.0
        LoadingProgressHUD.show(progress: 0, status: "Show Progress")
        perform(#selector(ViewController.increaseProgress), with: nil, afterDelay: 0.1)
    }
    
    @IBAction func showInfoWithStatus(_ sender: Any) {
        DispatchQueue.global(qos: .background).async {
            LoadingProgressHUD.showInfowithStatus("Useful Information.")
        }
    }
    
    
    @IBAction func showSuccessWithStatus(_ sender: Any) {
        LoadingProgressHUD.showSuccesswithStatus("Status Sucess")
    }
    
    @IBAction func showErrorWithStatus(_ sender: UIButton) {
        LoadingProgressHUD.showInfowithStatus("Status Error")
    }
    
    @IBAction func DISMISS(_ sender: UIButton) {
        DispatchQueue.global(qos: .background).async {
            LoadingProgressHUD.dismissWithCompletion({
                print ("Dismissed")
            })
        }
        if activityCount != 0 {
            activityCount -= 1
        }
    }
    
    @IBAction func popActivity(_ sender: UIButton) {
        LoadingProgressHUD.popActivity()
        if activityCount != 0 {
            activityCount -= 1
        }
    }
    
    @IBAction func changeStyle(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            LoadingProgressHUD.set(defaultStyle: .light)
        } else {
            LoadingProgressHUD.set(defaultStyle: .dark)
        }
    }
    
    @IBAction func AnimationStyle(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            LoadingProgressHUD.set(defaultAnimationType: .flat)
        } else {
            LoadingProgressHUD.set(defaultAnimationType: .native)
        }
    }
    
    
    @IBAction func setMaskType(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            LoadingProgressHUD.set(defaultMaskType: .none)
        } else if sender.selectedSegmentIndex == 1 {
            LoadingProgressHUD.set(defaultMaskType: .clear)
        } else if sender.selectedSegmentIndex == 2 {
            LoadingProgressHUD.set(defaultMaskType: .black)
        } else if sender.selectedSegmentIndex == 3 {
            LoadingProgressHUD.set(defaultMaskType: .gradient)
        } else {
            LoadingProgressHUD.set(defaultMaskType: .gradient)
        }
    }
    
    // MARK: - Notification handling
    @objc func handle(_ notification: Notification?) {
        if let aName = notification?.name {
            print("Notification received: \(aName)")
        }
        if let aKey = notification?.userInfo?[NotificationName.LoadingProgressHUDStatusUserInfoKey.getNotificationName()] {
            print("Status user info key: \(aKey)")
        }
        if notification?.name.rawValue == "LoadingProgressHUDDidReceiveTouchEvent" {
            closeProgress()
        }
        if ((notification?.name)!.rawValue == "LoadingProgressHUDDidReceiveTouchEvent") {
            closeProgress()
        }
    }
    
    @objc func increaseProgress() {
        progress += 0.1
        LoadingProgressHUD.show(progress: progress, status: "Here is a very large text. Hello world. It is the introduction of Programming")
        if progress < 1.0 {
            perform(#selector(increaseProgress), with: nil, afterDelay: 0.1)
        } else {
            if activityCount >= 1 {
                perform(#selector(closeProgress), with: nil, afterDelay: 0.4)
            } else {
                perform(#selector(closeProgress), with: nil, afterDelay: 0.4)
            }
        }
    }
    
    @objc func closeProgress() {
        LoadingProgressHUD.dismiss()
        activityCount = 0
    }
}
