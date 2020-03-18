//
//  PresentationAssembler.swift
//  Nebula
//
//  Created by Serhii Matvieiev on 4/3/19.
//  Copyright © 2019 Serhii Matvieiev. All rights reserved.
//

import UIKit

struct PresentationAssembler {
    static func makeWindow(withModule module: UIViewController) -> UIWindow {
        let window = UIWindow(frame: UIScreen.main.bounds)
        window.rootViewController = module
        window.makeKeyAndVisible()
        return window
    }
}
