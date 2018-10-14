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
    @IBOutlet weak var winnerView: UIView!
    @IBOutlet weak var diceNumber: UILabel!
    @IBOutlet weak var winnerNicknameLabel: UILabel!
    @IBOutlet weak var currentPlayerLabel: UILabel!
    
    @IBAction func gameOverTapped(_ sender: Any) {
        delegate?.didGameOver()
    }
    

    @IBAction func turnButtonTapped(_ sender: Any) {
//        let dice = Int(arc4random_uniform(6) + 1)
        let rollNumber = Int.random(in: 1..<7)
        diceNumber.text = String(rollNumber)
        delegate?.didMakeTurn(number: rollNumber)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        winnerView.isHidden = true
    }
}

protocol GameViewControllerDelegate: class {
    func didMakeTurn(number: Int)
    func didGameOver()
}


