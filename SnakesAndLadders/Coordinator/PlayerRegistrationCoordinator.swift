//
//  PlayerRegistrationCoordinator.swift
//  SneaksAndLadders
//
//  Created by radioshaolin on 12.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

protocol PlayerRegistrationCoordinatorDelegate: class {
    func playerRegistrationCoordinatorDidRequestCancel(playerRegistrationCoordinator: PlayerRegistrationCoordinator)
    func playerRegistrationCoordinator(playerRegistrationCoordinator: PlayerRegistrationCoordinator, didAdd userProfile: User)
}

class PlayerRegistrationCoordinator: RootViewCoordinator {
    var services: Services
    var childCoordinators: [Coordinator] = []
    
    var rootViewController: UIViewController {
        return self.navigationController
    }
    
    weak var delegate: PlayerRegistrationCoordinatorDelegate?
    
    private lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        return navigationController
    }()
    
    // MARK: - Init
    
    init(with services: Services) {
        self.services = services
    }
    
    func start() {
        let playerRegistrationVC = PlayerRegistrationViewController.fromStoryboard()
        playerRegistrationVC.services = services
        playerRegistrationVC.delegate = self
        self.navigationController.viewControllers = [playerRegistrationVC]
    }
    
    func showGameViewController() {
//        let gameVC = GameViewController.fromStoryboard()
//        gameVC.services = services
//        gameVC.delegate = self
//        self.navigationController.pushViewController(gameVC, animated: true)
    }
}


extension PlayerRegistrationCoordinator: PlayerRegistrationViewControllerDelegate {
    func playerRegistrationViewControllerDidTapClose(_ playerRegistrationVC: PlayerRegistrationViewController) {
        delegate?.playerRegistrationCoordinatorDidRequestCancel(playerRegistrationCoordinator: self)
    }
    
    func didReadyToPlay(playerRegistrationVC: PlayerRegistrationViewController) {
        print("Shazaaam!")
        let user = User(nickname: "Vano")
        delegate?.playerRegistrationCoordinator(playerRegistrationCoordinator: self, didAdd: user)
    }
}
