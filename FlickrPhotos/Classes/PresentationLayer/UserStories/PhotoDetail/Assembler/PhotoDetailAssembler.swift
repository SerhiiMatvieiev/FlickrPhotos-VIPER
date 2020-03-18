//
//  PhotoDetailAssembler.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 19/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import UIKit

enum PhotoDetailModuleAssembler {
    typealias ModuleInputConfigurator = (PhotoDetailModuleInput) -> Void
    static func makeModule(_ configurator: ModuleInputConfigurator? = nil) -> UIViewController {

        let view = PhotoDetailViewController()

        let router = PhotoDetailRouter()
        router.view = view

        let presenter = PhotoDetailPresenter()
        presenter.view = view
        presenter.router = router

        let interactor = PhotoDetailInteractor()
        interactor.output = presenter
        interactor.imageLoaderService = ServicesAssembler.standardImageLoaderService()

        presenter.interactor = interactor
        view.output = presenter

        configurator?(presenter)
	
        return view
    }

}
