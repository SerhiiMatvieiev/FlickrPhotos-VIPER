//
//  PhotoSearchCell.swift
//  FlickrPhotos
//
//  Created by Sergey Matveev on 30.06.17.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit
import SDWebImage

class PhotoSearchCell: UICollectionViewCell {

    @IBOutlet weak var flickrImageView: UIImageView!
    
    var photo: Photo? { didSet { updateUI() } }
    
    // MARK: - Private implementations
    
    private func updateUI() {
        flickrImageView.sd_setImage(with: photo?.photoURL)
    }
}
