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
        delegate?.didTapStart(homeVC: self)
    }
    
    @IBAction func joinGameTapped(_ sender: Any) {
        delegate?.didTapJoin(homeVC: self)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

protocol HomeViewControllerDelegate: class {
    func didTapStart(homeVC: HomeViewController)
    func didTapJoin(homeVC: HomeViewController)
}

