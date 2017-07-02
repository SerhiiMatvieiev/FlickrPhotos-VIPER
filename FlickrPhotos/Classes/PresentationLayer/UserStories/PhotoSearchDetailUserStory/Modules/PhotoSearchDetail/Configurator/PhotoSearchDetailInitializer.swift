//
//  PhotoSearchDetailPhotoSearchDetailInitializer.swift
//  FlickrPhotos
//
//  Created by Serhii.Matvieiev on 02/07/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

class PhotoSearchDetailModuleInitializer: NSObject {

    //Connect with object on storyboard
    @IBOutlet weak var photosearchdetailViewController: PhotoSearchDetailViewController!

    override func awakeFromNib() {

        let configurator = PhotoSearchDetailModuleConfigurator()
        configurator.configureModuleForViewInput(viewInput: photosearchdetailViewController)
    }

}
