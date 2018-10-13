//
//  AppCoordinator.swift
//  SneaksAndLadders
//
//  Created by radioshaolin on 11.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

/// The AppCoordinator is our first coordinator
/// In this example the AppCoordinator as a rootViewController
class AppCoordinator: RootViewCoordinator {
    /// Window to manage
    let window: UIWindow?
    
    // MARK: - Properties
    var services: Services
    var childCoordinators: [Coordinator] = []
    
    var rootViewController: UINavigationController {
        return self.navigationController
    }
    
    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        return navigationController
    }()
    
    // MARK: - Init
    public init(window: UIWindow?, services: Services) {
        self.services = services
        self.window = window
        self.window?.rootViewController = self.rootViewController
        self.window?.makeKeyAndVisible()
    }
    
    // MARK: - Functions
    
    /// Starts the coordinator
    public func start() {
        self.showHomeViewController()
    }
    
    private func showHomeViewController() {
        let homeViewController = HomeViewController.fromStoryboard()
        homeViewController.services = services
        homeViewController.delegate = self
        navigationController.pushViewController(homeViewController, animated: true)
    }
    
    func showPlayerRegistrationViewController() {
        let playerRegistrationCoordintor = PlayerRegistrationCoordinator(with: self.services)
        playerRegistrationCoordintor.delegate = self
        playerRegistrationCoordintor.start()
        addChildCoordinator(playerRegistrationCoordintor)
    }
    
     func showGameViewController() {
        let gameVC = GameViewController.fromStoryboard()
        gameVC.services = services
        gameVC.delegate = self
        navigationController.pushViewController(gameVC, animated: true)
    }
}


extension AppCoordinator: HomeViewControllerDelegate {
    func didTapStart(homeVC: HomeViewController) {
        services.isHost = true
        showPlayerRegistrationViewController()
    }
    
    func didTapJoin(homeVC: HomeViewController) {
        services.isHost = false
        showPlayerRegistrationViewController()
    }
}

extension AppCoordinator: PlayerRegistrationCoordinatorDelegate {
    func didTapBack(playerRegistrationCoordinator: PlayerRegistrationCoordinator, playerRegistrationVC: PlayerRegistrationViewController) {
        removeChildCoordinator(playerRegistrationCoordinator)
        rootViewController.popToRootViewController(animated: true)
    }
    
    func didStartGame(playerRegistrationCoordinator: PlayerRegistrationCoordinator, playerRegistrationVC: PlayerRegistrationViewController) {
        removeChildCoordinator(playerRegistrationCoordinator)
        rootViewController.popToRootViewController(animated: true)
    }

    
    func didAddUserProfile(user: User) {
        services.dataService.users.append(user)
    }
}
