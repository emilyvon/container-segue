//
//  DismissingAnimator.swift
//  container-segue
//
//  Created by Mengying Feng on 25/03/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import UIKit
import pop

class DismissingAnimator: NSObject, UIViewControllerAnimatedTransitioning {

    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)!
        toVC.view.tintAdjustmentMode = UIViewTintAdjustmentMode.Normal
        toVC.view.userInteractionEnabled = true;
        
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)
        
        
        var dimmingView: UIView!
        let subview = (transitionContext.containerView()?.subviews)! as NSArray
        
        subview.enumerateObjectsUsingBlock { (view: AnyObject, indext: Int, stop: UnsafeMutablePointer<ObjCBool>) in
            if view.layer.opacity < 1.0 {
                dimmingView = view as! UIView
                stop.memory = true
            }
        }
        
        let opacityAnimation = POPBasicAnimation(propertyNamed: kPOPLayerOpacity)
        opacityAnimation.toValue = 0.0
        
        let offscreenAnimation = POPBasicAnimation(propertyNamed: kPOPLayerPositionY)
        offscreenAnimation.toValue = -(fromVC?.view.layer.position.y)!
        offscreenAnimation.completionBlock = {(anim: POPAnimation!, finished: Bool) in
            transitionContext.completeTransition(true)
        }
        
        fromVC?.view.layer.pop_addAnimation(offscreenAnimation, forKey: "offscreenAnimation")
        dimmingView.layer.pop_addAnimation(opacityAnimation, forKey: "opacityAnimation")
        
        
        
    }
    
    
}
