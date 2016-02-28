//
//  BLYSettingsController.swift
//  Blinky - Elastic Transition
//
//  Created by Mitchell Porter on 2/28/16.
//  Copyright © 2016 Mentor Ventures, Inc. All rights reserved.
//

import UIKit
import ElasticTransition

class BLYSettingsController: UIViewController, ElasticMenuTransitionDelegate {
    
    // Elastic transiton
    var dismissByBackgroundTouch = true
    var dismissByBackgroundDrag = true
    var dismissByForegroundDrag = true

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.navigationBarHidden = true
    }

   
}
