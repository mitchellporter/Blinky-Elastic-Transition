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


    override func viewDidLoad() {
        super.viewDidLoad()

        transition.sticky = true
        transition.showShadow = true
        transition.panThreshold = 0.3
        transition.shadowRadius = 10.0
        transition.transformType = .TranslateMid
        delegate = transition
        
        NSTimer.scheduledTimerWithTimeInterval(5.0, target: self, selector: "nonInteractiveTransitionTest", userInfo: nil, repeats: false)
    }

    func nonInteractiveTransitionTest() {
        transition.edge = .Top
        transition.startingPoint = view.center
        performSegueWithIdentifier("navControllerToSettings", sender: self)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        //        let vc = segue.destinationViewController
        //        vc.hidesBottomBarWhenPushed = false
        //        vc.transitioningDelegate = transition
        //        vc.modalPresentationStyle = .Custom
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
