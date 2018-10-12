//
//  HomeViewController.swift
//  SneaksAndLadders
//
//  Created by radioshaolin on 11.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

final class HomeViewController: UIViewController {
    
    var services: Services?
    weak var delegate: HomeViewControllerDelegate?
    
    @IBAction func newGameTapped(_ sender: Any) {
        delegate?.didTapStartNewGame(homeVC: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        services?.dataService.users.append(User(nickname: "Vano"))
    }
}

protocol HomeViewControllerDelegate: class {
    func didTapStartNewGame(homeVC: HomeViewController)
    func didTapJoinToExistedGame(homeVC: HomeViewController)
}

