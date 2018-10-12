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
    
    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = true
        return navigationController
    }()
    var rootViewController: UIViewController {
        return self.navigationController
    }
    
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
        self.navigationController.viewControllers = [homeViewController]
    }
}


extension AppCoordinator: HomeViewControllerDelegate {
    func didTapStartNewGame(homeVC: HomeViewController) {
        print("BOOOO!")
        guard let services = homeVC.services else { return }
        self.services = services
        let playerRegistrationCoordintor = PlayerRegistrationCoordinator(with: self.services)
        playerRegistrationCoordintor.delegate = self
        playerRegistrationCoordintor.start()
        self.addChildCoordinator(playerRegistrationCoordintor)
        self.rootViewController.present(playerRegistrationCoordintor.rootViewController, animated: true, completion: nil)
    }
    
    func didTapJoinToExistedGame(homeVC: HomeViewController) {
        print("KABOOOM!")
    }
}

extension AppCoordinator: PlayerRegistrationCoordinatorDelegate {
    func playerRegistrationCoordinatorDidRequestCancel(playerRegistrationCoordinator: PlayerRegistrationCoordinator) {
        playerRegistrationCoordinator.rootViewController.dismiss(animated: true)
        removeChildCoordinator(playerRegistrationCoordinator)
    }
    
    func playerRegistrationCoordinator(playerRegistrationCoordinator: PlayerRegistrationCoordinator, didAdd userProfile: User) {
        services.dataService.users.append(userProfile)
        playerRegistrationCoordinator.rootViewController.dismiss(animated: true)
        removeChildCoordinator(playerRegistrationCoordinator)
    }
}
