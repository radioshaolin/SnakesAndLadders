//
//  StartSessionViewController.swift
//  SnakesAndLadders
//
//  Created by radioshaolin on 14.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

class StartSessionViewController: UIViewController {
    // Injected
    weak var delegate: StartSessionViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}

protocol StartSessionViewControllerDelegate: class {
    
}
