//
//  AppCoordinator.swift
//  SneaksAndLadders
//
//  Created by radioshaolin on 11.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit
import Apollo

/// The AppCoordinator is our first coordinator
/// In this example the AppCoordinator as a rootViewController
class AppCoordinator: RootViewCoordinator {
    /// Window to manage
    let window: UIWindow?

    let apollo = ApolloClient(url: URL(string: "https://snakes-n-ladders.ga")!)

    // MARK: - Properties
    var services: Services
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
        let playerRegistrationVC = PlayerRegistrationViewController.fromStoryboard(name: "PlayerRegistrationViewController")
        playerRegistrationVC.services = services
        playerRegistrationVC.delegate = self
        navigationController.isNavigationBarHidden = false
        rootViewController.pushViewController(playerRegistrationVC, animated: true)
    }
    
    func showSessionWaitViewConroller() {
        let sessionWaitVC = SessionWaitViewConroller.fromStoryboard(name: "PlayerRegistrationViewController")
        sessionWaitVC.delegate = self
        navigationController.isNavigationBarHidden = false
        rootViewController.pushViewController(sessionWaitVC, animated: true)
    }
    
     func showGameViewController() {
        let gameVC = GameViewController.fromStoryboard()
        gameVC.services = services
        gameVC.delegate = self
        navigationController.isNavigationBarHidden = false
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
    func didAdd(user: User) {
        services.dataService.users.append(user)
        let playerInput = PlayerInput.init(username: user.nickname)
        apollo.perform(mutation: RegisterMutation.init(input: playerInput))
        apollo.perform(mutation: CreateGameMutation.init())

    }
    
    func didStartGame(_ playerRegistrationVC: PlayerRegistrationViewController) {
        rootViewController.popViewController(animated: true)
        showGameViewController()
    }
    
    private func buildHeaderRequest(userName: String) -> URLRequest {
        let url = URL(string: "https://snakes-n-ladders.ga")!
        var request = URLRequest(url: url)
        request.setValue("\(userName)", forHTTPHeaderField: "X-PlayerId")
        request.httpMethod = "POST"
        return request
    }
}

extension AppCoordinator: SessionWaitViewConrollerDelegate {
    
}
