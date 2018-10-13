//
//  GameCoordinator.swift
//  SnakesAndLadders
//
//  Created by radioshaolin on 13.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

protocol GameCoordinatorDelegate: class {
    func didFinishGame(coordinator: GameCoordinator)
    func didMakeTurn(number: Int)
}

final class GameCoordinator: Coordinator {
    var services: Services
    var childCoordinators: [Coordinator] = []
    weak var delegate: GameCoordinatorDelegate?
    
    let rootViewController: UIViewController

    
    // MARK: - Init
    init(with services: Services, rootViewController: UIViewController) {
        self.services = services
        self.rootViewController = rootViewController
    }
    
    // MARK: - Functions
    /// Starts the coordinator
    public func start() {
        self.showGameViewController()
    }
    
    private func showGameViewController() {
        let gameVC = GameViewController.fromStoryboard()
        gameVC.services = services
        gameVC.delegate = self
        rootViewController.present(gameVC, animated: true, completion: nil)
    }
}

extension GameCoordinator: GameViewControllerDelegate {
    func didMakeTurn(number: Int) {
        delegate?.didMakeTurn(number: number)
    }
    
    func didGameOver() {
        delegate?.didFinishGame(coordinator: self)
    }
    
    
}
