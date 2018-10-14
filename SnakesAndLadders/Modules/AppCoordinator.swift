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
    
    var name: String = ""
    var sessionId: String = ""
    var isHost: Bool = false

    var apollo: ApolloClient = ApolloClient(url: URL(string: "https://api.snakes-n-ladders.ga")!)

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
    
    func buildApollo(userName: String, gameId: String) -> ApolloClient {
        let configuration = URLSessionConfiguration.default
        configuration.httpAdditionalHeaders = ["X-Profileid": userName,
                                               "X-Gameid" : gameId]
        let url = URL(string: "https://api.snakes-n-ladders.ga")!
        return ApolloClient(networkTransport: HTTPNetworkTransport(url: url, configuration: configuration))
    }
    
    private func showHomeViewController() {
        let homeViewController = HomeViewController.fromStoryboard()
        homeViewController.services = services
        homeViewController.delegate = self
        rootViewController.pushViewController(homeViewController, animated: true)
    }
    
    func showPlayerRegistrationViewController() {
        let playerRegistrationVC = PlayerRegistrationViewController.fromStoryboard()
        playerRegistrationVC.delegate = self
        navigationController.isNavigationBarHidden = false
        rootViewController.pushViewController(playerRegistrationVC, animated: true)
    }
    
    func showJoinSessionViewConroller() {
        let joinSessionVC = JoinSessionViewConroller.fromStoryboard(name: "SessionViewController")
        joinSessionVC.delegate = self
        navigationController.isNavigationBarHidden = false
        rootViewController.pushViewController(joinSessionVC, animated: true)
    }
    
    func showStartSessionViewConroller() {
        let startSessionVC = StartSessionViewController.fromStoryboard(name: "SessionViewController")
        startSessionVC.delegate = self
        navigationController.isNavigationBarHidden = false
        rootViewController.pushViewController(startSessionVC, animated: true)
    }
    
    func showGameViewController(gameId: String, nickname: String) {
        let gameVC = GameViewController.fromStoryboard()
        gameVC.gameId = gameId
        gameVC.nickname = nickname
        gameVC.delegate = self
        navigationController.isNavigationBarHidden = false
        rootViewController.pushViewController(gameVC, animated: true)
    }
}

extension AppCoordinator: HomeViewControllerDelegate {
    func didTapStart(homeVC: HomeViewController) {
        isHost = true
        showPlayerRegistrationViewController()
    }
    
    func didTapJoin(homeVC: HomeViewController) {
        isHost = false
        showPlayerRegistrationViewController()
    }
}

extension AppCoordinator: GameViewControllerDelegate {
    func didMakeTurn(number: Int) {
        apollo.perform(mutation: MakeTurnMutation.init(roll: number))
        
        //nekstPlayer

    }
    
    func didGameOver() {
        
    }
}

extension AppCoordinator: PlayerRegistrationViewControllerDelegate {
    func didAdd(user: String) {
        let playerInput = PlayerInput.init(username: user)
        name = user
        apollo.perform(mutation: RegisterMutation.init(input: playerInput))
        if isHost {
            apollo.perform(mutation: CreateGameMutation.init())  { [weak self] resultsGQL, error in
                guard let strongSelf = self,
                let id = resultsGQL?.data?.createGame.id else { return }

                strongSelf.sessionId = String(id)
                strongSelf.apollo = strongSelf.buildApollo(userName: user, gameId: id)
            }
            showGameViewController(gameId: sessionId, nickname: user)

        } else {
            showJoinSessionViewConroller()
        }
    }
}

extension AppCoordinator: JoinSessionViewConrollerDelegate {
    
}

extension AppCoordinator: StartSessionViewControllerDelegate {
    
}
