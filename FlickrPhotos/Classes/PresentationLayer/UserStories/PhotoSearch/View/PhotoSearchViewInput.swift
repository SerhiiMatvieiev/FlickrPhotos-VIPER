//
//  PhotoSearchViewInput.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 18/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

protocol PhotoSearchViewInput: class {
    func setupInitialState()
    func updateView(withPhotos photos: [PhotoVM], hasMore: Bool)
    func displayError(_ error: Error)
    func showWaitingLoader()
    func hideWaitingLoader()
}
