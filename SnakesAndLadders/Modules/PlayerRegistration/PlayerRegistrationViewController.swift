//
//  PlayerRegistrationViewController.swift
//  SneaksAndLadders
//
//  Created by radioshaolin on 12.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

final class PlayerRegistrationViewController: UIViewController {
    /// Injected properties
    var state: RegistrationState?
    
    weak var delegate: PlayerRegistrationViewControllerDelegate?
    
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var nextButton: UIButton!


    @IBAction func nextButtonTapped(_ sender: Any) {
        guard let nickname = nicknameTextField.text else { return }
        delegate?.didAdd(user: nickname)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        setupView(state: .registration)
        hideKeyboardWhenTappedAround() 
    }
    
//    func setupView(state: RegistrationState?) {
//        guard let state = state else { return }
//        switch state {
//            case .registration: setupRegistrationState()
//            case .waiting: setuptWaitingState()
//            case .ready: setupReadyState()
//        }
//    }
    
}

protocol PlayerRegistrationViewControllerDelegate: class {
    func didAdd(user: String)
}

enum RegistrationState {
    case registration
    case waiting
    case ready
}
