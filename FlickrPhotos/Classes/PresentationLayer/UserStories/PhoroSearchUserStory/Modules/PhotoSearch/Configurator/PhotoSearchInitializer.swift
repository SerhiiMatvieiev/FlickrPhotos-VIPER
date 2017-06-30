//
//  PhotoSearchPhotoSearchInitializer.swift
//  FlickrPhotos
//
//  Created by cd /Users/mac/Desktop/FlickrPhotos/ on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

class PhotoSearchModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var photosearchViewController: PhotoSearchViewController!

    override func awakeFromNib() {

        let configurator = PhotoSearchModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: photosearchViewController)
    }

}
