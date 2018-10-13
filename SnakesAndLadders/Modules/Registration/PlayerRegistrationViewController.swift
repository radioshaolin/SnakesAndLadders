//
//  PlayerRegistrationViewController.swift
//  SneaksAndLadders
//
//  Created by radioshaolin on 12.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

final class PlayerRegistrationViewController: UIViewController {
    var services: Services?
    weak var delegate: PlayerRegistrationViewControllerDelegate?
    
    @IBOutlet weak var waitView: UIView!
    @IBAction func doneButtonTapped(_ sender: Any) {
        self.delegate?.playerRegistrationViewControllerDidTapClose(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(state: .registration)
    }
    
    func setupView(state: RegistrationState) {
        switch state {
        case .registration: setUpRegistration()
        case .waiting: setUpWaiting()
        }
    }
    
    func setUpRegistration() {
        waitView.isHidden = true
    }
    
    func setUpWaiting() {
        waitView.isHidden = false
    }
}

protocol PlayerRegistrationViewControllerDelegate: class {
    func didReadyToPlay(playerRegistrationVC: PlayerRegistrationViewController)
    func playerRegistrationViewControllerDidTapClose(_ playerRegistrationVC: PlayerRegistrationViewController)
}

enum RegistrationState {
    case registration
    case waiting
}
