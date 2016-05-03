//
//  ModalViewController.swift
//  container-segue
//
//  Created by Mengying Feng on 25/03/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import UIKit

class ModalViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.layer.cornerRadius = 8.0
        self.view.layer.shadowColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 0.7).CGColor
        self.view.layer.shadowOpacity = 0.8
        self.view.layer.shadowRadius = 5.0
        self.view.layer.shadowOffset = CGSizeMake(0.0, 2.0)
        self.view.backgroundColor = UIColor.whiteColor()
        addContent()
    }
    
    func addContent() {
        
        // restartButton
        let restartButton = UIButton(type: UIButtonType.System)
        restartButton.translatesAutoresizingMaskIntoConstraints = false
        restartButton.tintColor = UIColor(red: 21/255, green: 126/255, blue: 251/255, alpha: 1.0)
//        restartButton.layer.cornerRadius = 5.0
//        restartButton.backgroundColor = UIColor.blueColor()
        restartButton.titleLabel!.font = UIFont(name: "Avenir", size: 15)
        restartButton.setTitle("Restart", forState: UIControlState.Normal)
        restartButton.addTarget(self, action: #selector(dismiss(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(restartButton)

        // resultCorrect
        let resultCorrect = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        resultCorrect.backgroundColor = UIColor.whiteColor()
        resultCorrect.translatesAutoresizingMaskIntoConstraints = false
        resultCorrect.text = "15"
        resultCorrect.font = UIFont(name: "Avenir", size: 80)
        resultCorrect.textColor = UIColor(red: 76/255, green: 217/255, blue: 100/255, alpha: 1.0)
        self.view.addSubview(resultCorrect)
        
        // resultWrong
        let resultWrong = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        resultWrong.backgroundColor = UIColor.whiteColor()
        resultWrong.translatesAutoresizingMaskIntoConstraints = false
        resultWrong.text = "15"
        resultWrong.font = UIFont(name: "Avenir", size: 80)
        resultWrong.textColor = UIColor(red: 255/255, green: 59/255, blue: 48/255, alpha: 1.0)
        self.view.addSubview(resultWrong)
        
        // resultLabel
        let resultLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        resultLabel.translatesAutoresizingMaskIntoConstraints = false
        resultLabel.text = "Score"
        resultLabel.font = UIFont(name: "Avenir", size: 25)
        resultLabel.textColor = UIColor.blackColor()
        self.view.addSubview(resultLabel)
        
//        // correctImageView
//        let correctImageview = UIImageView(image: UIImage(named: "correct"))
//        correctImageview.frame = CGRectMake(0, 0, 30, 30)
//        self.view.addSubview(correctImageview)
//        
//        // wrongImageView
//        let wrongImageView = UIImageView(image: UIImage(named: "wrong"))
//        wrongImageView.frame = CGRectMake(0, 0, 30, 30)
//        self.view.addSubview(wrongImageView)
        
        // views
        let views = ["restartButton": restartButton, "resultCorrect": resultCorrect, "resultWrong": resultWrong, "resultLabel": resultLabel, /*"correctImageView": correctImageview, "wrongImageView": wrongImageView*/]
        var allConstraints = [NSLayoutConstraint]()
        
//        let resultLabelConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[resultLabel]", options: [], metrics: nil, views: views)
        let resultLabelHorizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-100-[resultLabel]-100-|", options: [], metrics: nil, views: views)
        allConstraints += resultLabelHorizontalConstraints
        
        let resultCorrectConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-20-[resultCorrect]", options: [], metrics: nil, views: views)
        allConstraints += resultCorrectConstraints
        
        
        let restartButtonConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[restartButton]-|", options: [], metrics: nil, views: views)
        allConstraints += restartButtonConstraints
        
        let restartButtonHorizontalContraints = NSLayoutConstraint.constraintsWithVisualFormat("H:[restartButton(300)]", options: [], metrics: nil, views: views)
        allConstraints += restartButtonHorizontalContraints
    
        let restartButtonVerticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[resultLabel]-300-[restartButton]", options: [.AlignAllLeading, .AlignAllTrailing], metrics: nil, views: views)
        allConstraints += restartButtonVerticalConstraints
        
        let resultCorrectWrongHorizontalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("H:|-[resultCorrect]-50-[resultWrong]-|", options: [.AlignAllCenterY], metrics: nil, views: views)
        allConstraints += resultCorrectWrongHorizontalConstraints
        
        let resultLabelToResultCorrectVertialConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[resultLabel]-100-[resultCorrect]", options: [], metrics: nil, views: views)
        allConstraints += resultLabelToResultCorrectVertialConstraints
        
//        let correctImageViewResultCorrentVerticalConstraints = NSLayoutConstraint.constraintsWithVisualFormat("V:[resultCorrect]-8-[correctImageView]", options: [], metrics: nil, views: views)
//        allConstraints += correctImageViewResultCorrentVerticalConstraints
        
//        self.view.addConstraint(NSLayoutConstraint(item: restartButton, attribute: NSLayoutAttribute.CenterX, relatedBy: .Equal, toItem: self.view, attribute: NSLayoutAttribute.CenterX, multiplier: 1.0, constant: 0.0))
//        
//        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:[dismissButton(50)]-|", options: NSLayoutFormatOptions.AlignAllTop, metrics: nil, views: views))
//
//        self.view.addConstraint(NSLayoutConstraint(item: resultCorrect, attribute: .CenterX, relatedBy: .Equal, toItem: self.view, attribute: .CenterX, multiplier: 1.0, constant: 0.0))
//        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("H:|-[resultCorrect(100)]", options: .AlignAllTop, metrics: nil, views:
//            views))
//        self.view.addConstraints(NSLayoutConstraint.constraintsWithVisualFormat("V:|-[resultCorrect]", options: .AlignAllCenterX, metrics: nil, views: views))
        
        // add all constraints
        NSLayoutConstraint.activateConstraints(allConstraints)
    }
    
    func dismiss(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
