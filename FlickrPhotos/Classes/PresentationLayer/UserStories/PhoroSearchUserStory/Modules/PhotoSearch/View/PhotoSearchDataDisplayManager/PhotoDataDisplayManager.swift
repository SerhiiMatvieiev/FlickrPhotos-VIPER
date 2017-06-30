//
//  DataDisplayManagerDelegate.swift
//  FlickrPhotos
//
//  Created by Sergey Matveev on 30.06.17.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

protocol PhotoSearchDataDisplayManager: DataDisplayManager {
    
    /**
     *  @author Serhii Matvieiew
     *
     *  Update collectionView.
     */
    func updateCollectionView(withPhotos: [Photo])

}
