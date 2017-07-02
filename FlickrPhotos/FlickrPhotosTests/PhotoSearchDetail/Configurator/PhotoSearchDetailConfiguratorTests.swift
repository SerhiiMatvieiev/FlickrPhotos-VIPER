//
//  PhotoSearchDetailPhotoSearchDetailConfiguratorTests.swift
//  FlickrPhotos
//
//  Created by Serhii.Matvieiev on 02/07/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import XCTest

class PhotoSearchDetailModuleConfiguratorTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testConfigureModuleForViewController() {

        //given
        let viewController = PhotoSearchDetailViewControllerMock()
        let configurator = PhotoSearchDetailModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "PhotoSearchDetailViewController is nil after configuration")
        XCTAssertTrue(viewController.output is PhotoSearchDetailPresenter, "output is not PhotoSearchDetailPresenter")

        let presenter: PhotoSearchDetailPresenter = viewController.output as! PhotoSearchDetailPresenter
        XCTAssertNotNil(presenter.view, "view in PhotoSearchDetailPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in PhotoSearchDetailPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is PhotoSearchDetailRouter, "router is not PhotoSearchDetailRouter")

        let interactor: PhotoSearchDetailInteractor = presenter.interactor as! PhotoSearchDetailInteractor
        XCTAssertNotNil(interactor.output, "output in PhotoSearchDetailInteractor is nil after configuration")
    }

    class PhotoSearchDetailViewControllerMock: PhotoSearchDetailViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
