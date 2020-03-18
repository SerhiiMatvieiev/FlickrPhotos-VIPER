//
//  Router.swift
//  FlickrPhotos-VIPER
//
//  Created by Sergey Matveev on 19.03.2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import UIKit

protocol Router {
    associatedtype InputType
    
    var view: InputType? { get set }
    var viewController: UIViewController? { get }
    var navigationController: UINavigationController? { get }
}

extension Router {
    typealias PresentCompletion = () -> Void
    
    var viewController: UIViewController? {
        self.view as? UIViewController
    }
    var navigationController: UINavigationController? {
        return self.viewController?.navigationController
    }
}
