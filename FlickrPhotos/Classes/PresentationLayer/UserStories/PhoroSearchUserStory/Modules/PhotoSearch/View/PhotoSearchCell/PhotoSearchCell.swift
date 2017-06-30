//
//  PhotoSearchCell.swift
//  FlickrPhotos
//
//  Created by Sergey Matveev on 30.06.17.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

class PhotoSearchCell: UICollectionViewCell {

    var photo: Photo? { didSet { updateUI() } }
    
    private func updateUI() {
        backgroundColor = photo?.color
    }
}
