//
//  SessionWaitViewConroller.swift
//  SnakesAndLadders
//
//  Created by radioshaolin on 14.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

final class JoinSessionViewConroller: UIViewController {
    
    weak var delegate: JoinSessionViewConrollerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hideKeyboardWhenTappedAround() 
    }
}

protocol JoinSessionViewConrollerDelegate: class {
    
}
