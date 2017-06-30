//
//  PhotoSearchPhotoSearchPresenterTests.swift
//  FlickrPhotos
//
//  Created by cd /Users/mac/Desktop/FlickrPhotos/ on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import XCTest

class PhotoSearchPresenterTest: XCTestCase {

    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }

    class MockInteractor: PhotoSearchInteractorInput {

    }

    class MockRouter: PhotoSearchRouterInput {

    }

    class MockViewController: PhotoSearchViewInput {

        func setupInitialState() {

        }
    }
}
