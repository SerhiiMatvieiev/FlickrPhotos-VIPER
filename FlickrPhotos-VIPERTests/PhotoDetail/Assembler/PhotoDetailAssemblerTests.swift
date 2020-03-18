//
//  PhotoDetailAssemblerTests.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 19/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import XCTest
@testable import FlickrPhotos-VIPER

class PhotoDetailModuleAssemblerTests: XCTestCase {

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
        let view = PhotoDetailModuleAssembler.makeModule() as! PhotoDetailViewController

        //then
        XCTAssertNotNil(view.output, "PhotoDetailViewController is nil after configuration")
        XCTAssertTrue(view.output is PhotoDetailPresenter, "output is not PhotoDetailPresenter")

        let presenter: PhotoDetailPresenter = view.output as! PhotoDetailPresenter
        XCTAssertNotNil(presenter.view, "view in PhotoDetailPresenter is nil after configuration")
        XCTAssertNotNil(presenter.router, "router in PhotoDetailPresenter is nil after configuration")
        XCTAssertTrue(presenter.router is PhotoDetailRouter, "router is not PhotoDetailRouter")

        let interactor: PhotoDetailInteractor = presenter.interactor as! PhotoDetailInteractor
        XCTAssertNotNil(interactor.output, "output in PhotoDetailInteractor is nil after configuration")
    }

}
