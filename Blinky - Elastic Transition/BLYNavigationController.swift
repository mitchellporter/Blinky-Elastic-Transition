//
//  BLYNavigationController.swift
//  Blinky - Elastic Transition
//
//  Created by Mitchell Porter on 2/28/16.
//  Copyright © 2016 Mentor Ventures, Inc. All rights reserved.
//

import UIKit
import ElasticTransition

class BLYNavigationController: UINavigationController {
    
    let transition = ElasticTransition()
    let normalGesture = UIPanGestureRecognizer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        normalGesture.addTarget(self, action: "handleNormalPan:")
        navigationBar.addGestureRecognizer(normalGesture)
    
        transition.sticky = true
        transition.showShadow = true
        transition.panThreshold = 0.3
        transition.shadowRadius = 10.0
        transition.transformType = .TranslateMid
        delegate = transition
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBarHidden = false
    }
    
    func handleEdgePan(pan:UIPanGestureRecognizer){
        print("edge pan")
        if pan.state == .Began{
            transition.edge = .Top
            transition.startInteractiveTransition(self, segueIdentifier: "navControllerToSettings", gestureRecognizer: pan)
        }else{
            transition.updateInteractiveTransition(gestureRecognizer: pan)
        }
    }
    
    func handleNormalPan(pan:UIPanGestureRecognizer){
        print("normal pan")
        if pan.state == .Began{
            transition.edge = .Top
            transition.startInteractiveTransition(self, segueIdentifier: "navControllerToSettings", gestureRecognizer: pan)
        }else{
            transition.updateInteractiveTransition(gestureRecognizer: pan)
        }
    }

    func nonInteractiveTransitionTest() {
        transition.edge = .Top
        transition.startingPoint = view.center
        performSegueWithIdentifier("navControllerToSettings", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
                let vc = segue.destinationViewController
                vc.hidesBottomBarWhenPushed = false
                vc.transitioningDelegate = transition
                vc.modalPresentationStyle = .Custom
    }
}
