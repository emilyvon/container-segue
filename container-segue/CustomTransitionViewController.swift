//
//  ViewController.swift
//  container-segue
//
//  Created by Mengying Feng on 25/03/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import UIKit

class CustomTransitionViewController: UIViewController, UIViewControllerTransitioningDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.whiteColor()
        //        addPresentButton()
    }
    
    
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return PresentingAnimator()
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return DismissingAnimator()
    }
    
    
    //    func addPresentButton() {
    //        let presentButton = UIButton(type: UIButtonType.System)
    //        presentButton.translatesAutoresizingMaskIntoConstraints = false
    //        presentButton.setTitle("Present Modal View Controller", forState: UIControlState.Normal)
    //        presentButton.addTarget(self, action: #selector(btnPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
    //        self.view.addSubview(presentButton)
    //
    //        self.view.addConstraint(NSLayoutConstraint(item: presentButton, attribute: NSLayoutAttribute.CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
    //
    //        self.view.addConstraint(NSLayoutConstraint(item: presentButton, attribute: NSLayoutAttribute.CenterY, relatedBy: .Equal, toItem: self.view, attribute: .CenterY, multiplier: 1.0, constant: 0.0))
    //
    //
    //    }
    
    @IBAction func btnPressed(sender: AnyObject) {
        let modalViewController = ModalViewController()
        modalViewController.transitioningDelegate = self
        modalViewController.modalPresentationStyle = UIModalPresentationStyle.Custom
        presentViewController(modalViewController, animated: true, completion: nil)
    }
    
    
    @IBAction func useXibBtnPressed(sender: AnyObject) {
        let useXibVC = UseXibViewController()
        useXibVC.transitioningDelegate = self
        useXibVC.modalPresentationStyle = UIModalPresentationStyle.Custom
//        useXibVC.modalPresentationStyle = UIModalPresentationStyle.OverCurrentContext
//        useXibVC.preferredContentSize = CGSizeMake(200, 300)
        presentViewController(useXibVC, animated: true, completion: nil)
//        useXibVC.view.superview?.frame = CGRectMake(0, 0, 250, 250)
    }
    
    
}

