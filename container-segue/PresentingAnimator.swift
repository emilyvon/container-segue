//
//  PresentingAnimator.swift
//  container-segue
//
//  Created by Mengying Feng on 25/03/2016.
//  Copyright © 2016 Mengying Feng. All rights reserved.
//

import UIKit
import pop

class PresentingAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey)?.view
        
        fromView?.tintAdjustmentMode = UIViewTintAdjustmentMode.Dimmed
        fromView?.userInteractionEnabled = false
        
        let dimmingView = UIView(frame: fromView!.bounds)
        dimmingView.backgroundColor = UIColor(red: 120/255, green: 120/255, blue: 120/255, alpha: 1.0)
        dimmingView.layer.opacity = 0.0;
        
        let toView = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey)?.view
        toView?.frame = CGRectMake(0, 0, CGRectGetWidth((transitionContext.containerView()?.bounds)!) - 104, CGRectGetHeight((transitionContext.containerView()?.bounds)!)-288)
        toView?.center = CGPointMake((transitionContext.containerView()?.center.x)!, (transitionContext.containerView()?.center.y)!)
        transitionContext.containerView()?.addSubview(dimmingView)
        transitionContext.containerView()?.addSubview(toView!)
        
        let positionAnimation = POPSpringAnimation(propertyNamed: kPOPLayerPositionY)
        positionAnimation.toValue = transitionContext.containerView()?.center.y
        positionAnimation.springBounciness = 10;
        positionAnimation.completionBlock = {(anim: POPAnimation!, finished: Bool!) -> Void in
            transitionContext.completeTransition(true)
        }
        
        let scaleAnimation = POPSpringAnimation(propertyNamed: kPOPLayerScaleXY)
        scaleAnimation.springBounciness = 20
        scaleAnimation.fromValue = NSValue(CGPoint: CGPointMake(1.2, 1.4))
        
        let opacityAnimation = POPBasicAnimation(propertyNamed: kPOPLayerOpacity)
        opacityAnimation.toValue = 0.2
        
        toView?.layer.pop_addAnimation(positionAnimation, forKey: "positionAnimation")
        toView?.layer.pop_addAnimation(scaleAnimation, forKey: "scaleAnimation")
        dimmingView.layer.pop_addAnimation(opacityAnimation, forKey: "opacityAnimation")
    }
}
