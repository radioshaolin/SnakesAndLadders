//
//  PlayerRegistrationCoordinator.swift
//  SneaksAndLadders
//
//  Created by radioshaolin on 12.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

protocol PlayerRegistrationCoordinatorDelegate: class {
    func didTapBack(playerRegistrationCoordinator: PlayerRegistrationCoordinator,
                    playerRegistrationVC: PlayerRegistrationViewController)
    func didAddUserProfile(user: User)
    func didStartGame(playerRegistrationCoordinator: PlayerRegistrationCoordinator,
                      playerRegistrationVC: PlayerRegistrationViewController)
}

class PlayerRegistrationCoordinator: Coordinator {
    var services: Services
    var childCoordinators: [Coordinator] = []
    weak var delegate: PlayerRegistrationCoordinatorDelegate?
    
    // MARK: - Init
    init(with services: Services) {
        self.services = services
    }
    
    func start() {
        showRegistrationViewController()
    }
    
    private func showRegistrationViewController() {
        let playerRegistrationVC = PlayerRegistrationViewController.fromStoryboard()
        playerRegistrationVC.services = services
        playerRegistrationVC.delegate = self
        rootNavigationController.pushViewController(playerRegistrationVC, animated: true)
    }
}

extension PlayerRegistrationCoordinator: PlayerRegistrationViewControllerDelegate {
    func didAddUserProfile(user: User) {
        delegate?.didAddUserProfile(user: user)
    }
    
    func didTapBack(_ playerRegistrationVC: PlayerRegistrationViewController){
        delegate?.didTapBack(playerRegistrationCoordinator: self,
                            playerRegistrationVC: playerRegistrationVC)
    }
    
    func didStartGame(_ playerRegistrationVC: PlayerRegistrationViewController) {
        delegate?.didStartGame(playerRegistrationCoordinator: self,
                                playerRegistrationVC: playerRegistrationVC)
    }
}
