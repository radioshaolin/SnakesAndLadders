//
//  GameViewController.swift
//  SnakesAndLadders
//
//  Created by radioshaolin on 13.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

final class GameViewController: UIViewController {
    /// Injected properties
    var services: Services?
    weak var delegate: GameViewControllerDelegate?
    
    @IBOutlet weak var gameView: UIView!
    @IBOutlet weak var resultView: UIView!
    @IBOutlet weak var winnerNicknameLabel: UILabel!
    @IBOutlet weak var currentPlayerLabel: UILabel!
    @IBOutlet weak var turnNotificationLabel: UILabel!
    @IBOutlet weak var dropResultLabel: UILabel!
    @IBOutlet weak var turnButton: UIButton!
    
    @IBAction func gameOverTapped(_ sender: Any) {
        delegate?.didGameOver()
    }
    
    @IBAction func turnButtonTapped(_ sender: Any) {
        delegate?.didMakeTurn(number: 5)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

protocol GameViewControllerDelegate: class {
    func didMakeTurn(number: Int)
    func didGameOver()
}

enum GameState {
    
}
