//
//  PhotoSearchAssemblerTests.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 18/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import XCTest
@testable import FlickrPhotos-VIPER

class PhotoSearchModuleAssemblerTests: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    func testModuleAssemblerForViewController() {

        //given
        let view = PhotoSearchModuleAssembler.makeModule() as! PhotoSearchViewController

        //then
        XCTAssertNotNil(view.output, "PhotoSearchViewController is nil after configuration")
        XCTAssertTrue(view.output is PhotoSearchPresenter, "output is not PhotoSearchPresenter")

        let presenter: PhotoSearchPresenter = view.output as! PhotoSearchPresenter
        XCTAssertNotNil(presenter.view, "view in PhotoSearchPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in PhotoSearchPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is PhotoSearchRouter, "router is not PhotoSearchRouter")

        let interactor: PhotoSearchInteractor = presenter.interactor as! PhotoSearchInteractor
        XCTAssertNotNil(interactor.output, "output in PhotoSearchInteractor is nil after configuration")
    }

}
