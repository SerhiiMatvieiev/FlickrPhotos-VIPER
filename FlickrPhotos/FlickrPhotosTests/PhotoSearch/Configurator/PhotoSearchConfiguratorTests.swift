//
//  PhotoSearchPhotoSearchConfiguratorTests.swift
//  FlickrPhotos
//
//  Created by cd /Users/mac/Desktop/FlickrPhotos/ on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import XCTest

class PhotoSearchModuleConfiguratorTests: XCTestCase {

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
        let viewController = PhotoSearchViewControllerMock()
        let configurator = PhotoSearchModuleConfigurator()

        //when
        configurator.configureModuleForViewInput(viewInput: viewController)

        //then
        XCTAssertNotNil(viewController.output, "PhotoSearchViewController is nil after configuration")
        XCTAssertTrue(viewController.output is PhotoSearchPresenter, "output is not PhotoSearchPresenter")

        let presenter: PhotoSearchPresenter = viewController.output as! PhotoSearchPresenter
        XCTAssertNotNil(presenter.view, "view in PhotoSearchPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in PhotoSearchPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is PhotoSearchRouter, "router is not PhotoSearchRouter")

        let interactor: PhotoSearchInteractor = presenter.interactor as! PhotoSearchInteractor
        XCTAssertNotNil(interactor.output, "output in PhotoSearchInteractor is nil after configuration")
    }

    class PhotoSearchViewControllerMock: PhotoSearchViewController {

        var setupInitialStateDidCall = false

        override func setupInitialState() {
            setupInitialStateDidCall = true
        }
    }
}
