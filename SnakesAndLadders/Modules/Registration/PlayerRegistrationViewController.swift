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
    
    @IBOutlet weak var nicknameTextField: UITextField!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var waitView: UIView!
    @IBOutlet weak var player1NicknameLabel: UILabel!
    @IBOutlet weak var player2NicknameLabel: UILabel!
    @IBOutlet weak var player3NicknameLabel: UILabel!
    @IBOutlet weak var player4NicknameLabel: UILabel!

    @IBAction func nextButtonTapped(_ sender: Any) {
        let nickname = nicknameTextField.text ?? "unknown"
        let user = User(nickname: nickname)
        player1NicknameLabel.text = nickname
        delegate?.didAdd(user: user)
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
            case .ready: setupReadyState()
        }
    }
    
    private func setupRegistrationState() {
        waitView.isHidden = true
    }
    
    private func setuptWaitingState() {
        waitView.isHidden = false
        let startButtonTitle = "Wait for other players"
        startButton.setTitle(startButtonTitle, for: .normal)
        startButton.isEnabled = false
    }
    
    private func setupReadyState() {
        guard let services = services,
        let isHost = services.isHost else { return }
        let startButtonTitle = isHost ? "Start" : "Ready"
        startButton.setTitle(startButtonTitle, for: .normal)
        startButton.isEnabled = isHost
    }
}

protocol PlayerRegistrationViewControllerDelegate: class {
    func didAdd(user: User)
    func didStartGame(_ playerRegistrationVC: PlayerRegistrationViewController)
}

enum RegistrationState {
    case registration
    case waiting
    case ready
}
