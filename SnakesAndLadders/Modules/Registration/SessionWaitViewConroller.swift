//
//  SessionWaitViewConroller.swift
//  SnakesAndLadders
//
//  Created by radioshaolin on 14.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

final class SessionWaitViewConroller: UIViewController {
    
    weak var delegate: SessionWaitViewConrollerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

protocol SessionWaitViewConrollerDelegate: class {
    
}
