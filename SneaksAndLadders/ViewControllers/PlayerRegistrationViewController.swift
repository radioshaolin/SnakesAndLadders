//
//  PlayerRegistrationViewController.swift
//  SneaksAndLadders
//
//  Created by radioshaolin on 12.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

class PlayerRegistrationViewController: UIViewController {
    var services: Services?
    weak var delegate: PlayerRegistrationViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

protocol PlayerRegistrationViewControllerDelegate: class {
    func didReadyToPlay(playerRegistrationVC: PlayerRegistrationViewController)
}
