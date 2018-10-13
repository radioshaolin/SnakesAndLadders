//
//  GameCoordinator.swift
//  SnakesAndLadders
//
//  Created by radioshaolin on 13.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

protocol GameCoordinatorDelegate: class {
    
}

final class GameCoordinator: Coordinator {
    var services: Services
    
    var childCoordinators: [Coordinator] = []
    
    
}

