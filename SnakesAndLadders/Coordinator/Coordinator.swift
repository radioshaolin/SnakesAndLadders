//
//  Coordinator.swift
//  SneaksAndLadders
//
//  Created by radioshaolin on 11.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

/// The Coordinator protocol
public protocol Coordinator: class {
    /// The services that the coordinator can use
    var services: Services { get }
}

public extension Coordinator {
    var rootNavigationController: UINavigationController {
        return UIApplication.shared.keyWindow!.rootViewController as! UINavigationController
    }
}

