//
//  UIViewController+NavigationController.swift
//  SnakesAndLadders
//
//  Created by radioshaolin on 14.10.18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

extension UIViewController {
    var rootNavigationController: UINavigationController {
        return UIApplication.shared.keyWindow!.rootViewController as! UINavigationController
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
