//
//  UIViewController+Storyboard.swift
//  SneaksAndLadders
//
//  Created by Ivan Zemlyaniy on 10/12/18.
//  Copyright © 2018 Radio Shaolin. All rights reserved.
//

import UIKit

public extension UIViewController {
    /// General extension to instansiate View Controller from Storyboard file
    public class func fromStoryboard(name: String? = nil) -> Self {
        let name = name ?? String(describing: self)
        let bundle = Bundle(for: self)
        return instantiateFromStoryboardHelper(type: self, name: name, bundle: bundle)
    }
    
    private class func instantiateFromStoryboardHelper<T>(type: T.Type, name: String, bundle: Bundle? = nil) -> T {
        let storyboard = UIStoryboard.init(name: name, bundle: bundle)
        let identifier = String(describing: type)
        return storyboard.instantiateViewController(withIdentifier: identifier) as! T
    }
}

