//
//  UseXibViewController.swift
//  container-segue
//
//  Created by Mengying Feng on 26/03/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import UIKit
import pop

class UseXibViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer.cornerRadius = 8.0
        self.view.layer.shadowColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 0.7).CGColor
        self.view.layer.shadowOpacity = 0.8
        self.view.layer.shadowRadius = 5.0
        self.view.layer.shadowOffset = CGSizeMake(0.0, 2.0)
        self.view.backgroundColor = UIColor.whiteColor()

        
        
        
    }
    
    @IBAction func dismiss(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
//    override func viewWillLayoutSubviews() {
//        super.viewWillLayoutSubviews()
//        
//        self.view.superview?.bounds = CGRectMake(0, 0, 250, 250)
//        self.view.superview?.backgroundColor = UIColor.clearColor()
//        
//        self.view.layer.cornerRadius = 8.0
//        self.view.layer.shadowColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 0.7).CGColor
//        self.view.layer.shadowOpacity = 0.8
//        self.view.layer.shadowRadius = 5.0
//        self.view.layer.shadowOffset = CGSizeMake(0.0, 2.0)
//        self.view.backgroundColor = UIColor.whiteColor()
//
//        
//    }
    
    
}
