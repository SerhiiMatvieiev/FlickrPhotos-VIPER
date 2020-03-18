//
//  AppDelegate.swift
//  FlickrPhotos
//
//  Created by Serhii Matvieiev on 30.06.17.
//  Copyright © 2017 Serhii Matvieiev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        let photoSearchModule = PhotoSearchModuleAssembler.makeModule()
        window = PresentationAssembler.makeWindow(withModule: photoSearchModule.navigated())
        return true
    }
}
