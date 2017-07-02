//
//  PhotoSearchDetailPhotoSearchDetailConfigurator.swift
//  FlickrPhotos
//
//  Created by Serhii.Matvieiev on 02/07/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

class PhotoSearchDetailModuleConfigurator {

    func configureModuleForViewInput<UIViewController>(viewInput: UIViewController) {

        if let viewController = viewInput as? PhotoSearchDetailViewController {
            configure(viewController: viewController)
        }
    }

    private func configure(viewController: PhotoSearchDetailViewController) {

        let router = PhotoSearchDetailRouter()

        let presenter = PhotoSearchDetailPresenter()
        presenter.view = viewController
        presenter.router = router

        let interactor = PhotoSearchDetailInteractor()
        interactor.output = presenter

        presenter.interactor = interactor
        viewController.output = presenter
    }

}
