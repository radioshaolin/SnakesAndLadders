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
    var rootViewController: UINavigationController {
        return self.navigationController
    }
    lazy var navigationController: UINavigationController = {
        let navigationController = UINavigationController()
        navigationController.isNavigationBarHidden = false
        return navigationController
    }()
    
    // MARK: - Init
    public init(window: UIWindow?, services: Services) {
        self.services = services
        self.window = window
        self.window?.rootViewController = self.rootViewController
        self.window?.backgroundColor = .white
        self.window?.makeKeyAndVisible()
    }
    
    // MARK: - Functions
    /// Starts the coordinator
    public func start() {
        showHomeViewController()
    }
    
    private func showHomeViewController() {
        let homeViewController = HomeViewController.fromStoryboard()
        homeViewController.services = services
        homeViewController.delegate = self
        rootViewController.pushViewController(homeViewController, animated: true)
    }
    
    func showPlayerRegistrationViewController() {
        let playerRegistrationVC = PlayerRegistrationViewController.fromStoryboard()
        playerRegistrationVC.services = services
        playerRegistrationVC.delegate = self
        rootViewController.pushViewController(playerRegistrationVC, animated: true)
    }
    
     func showGameViewController() {
        let gameVC = GameViewController.fromStoryboard()
        gameVC.services = services
        gameVC.delegate = self
        rootViewController.pushViewController(gameVC, animated: true)
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

extension AppCoordinator: GameViewControllerDelegate {
    func didMakeTurn(number: Int) {
        
    }
    
    func didGameOver() {
        
    }
}

extension AppCoordinator: PlayerRegistrationViewControllerDelegate {
    func didAddUserProfile(user: User) {
        services.dataService.users.append(user)
    }
    
    func didTapBack(_ playerRegistrationVC: PlayerRegistrationViewController) {
        rootViewController.popViewController(animated: true)
    }
    
    func didStartGame(_ playerRegistrationVC: PlayerRegistrationViewController) {
        rootViewController.popViewController(animated: true)
        showGameViewController()
    }
}
