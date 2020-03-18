//
//  UIViewController+Common.swift
//  FlickrPhotos-VIPER
//
//  Created by Sergey Matveev on 19.03.2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import UIKit

extension UIViewController {
    func navigated() -> UINavigationController {
        return UINavigationController(rootViewController: self)
    }
}
