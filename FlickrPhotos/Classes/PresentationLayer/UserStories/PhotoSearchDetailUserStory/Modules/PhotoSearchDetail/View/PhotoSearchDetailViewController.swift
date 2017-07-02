//
//  PhotoSearchDetailPhotoSearchDetailViewController.swift
//  FlickrPhotos
//
//  Created by Serhii.Matvieiev on 02/07/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

class PhotoSearchDetailViewController: UIViewController, PhotoSearchDetailViewInput {

    var output: PhotoSearchDetailViewOutput!

    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }


    // MARK: PhotoSearchDetailViewInput
    func setupInitialState() {
    }
}
