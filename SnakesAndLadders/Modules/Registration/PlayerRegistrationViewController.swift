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
    var services: Services?
    var state: RegistrationState?
    
    weak var delegate: PlayerRegistrationViewControllerDelegate?
    
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var waitView: UIView!
    
    @IBAction func doneButtonTapped(_ sender: Any) {
        delegate?.didTapBack(self)
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        let user = User(nickname: "Black Lord")
        delegate?.didAddUserProfile(user: user)
        setupView(state: .waiting)
    }
    
    @IBAction func startButtonTapped(_ sender: Any) {
        delegate?.didStartGame(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView(state: .registration)
    }
    
    func setupView(state: RegistrationState?) {
        guard let state = state else { return }
        switch state {
            case .registration: setupRegistrationState()
            case .waiting: setuptWaitingState()
        }
    }
    
    private func setupRegistrationState() {
        waitView.isHidden = true
    }
    
    private func setuptWaitingState() {
        guard let services = services,
            let isHost = services.isHost else { return }
        waitView.isHidden = false
        let startButtonTitle = isHost ? "Start" : "Wait for other players"
        startButton.setTitle(startButtonTitle, for: .normal)
        startButton.isEnabled = isHost
    }
}

protocol PlayerRegistrationViewControllerDelegate: class {
    func didAddUserProfile(user: User)
    func didTapBack(_ playerRegistrationVC: PlayerRegistrationViewController)
    func didStartGame(_ playerRegistrationVC: PlayerRegistrationViewController)
}

enum RegistrationState {
    case registration
    case waiting
}
