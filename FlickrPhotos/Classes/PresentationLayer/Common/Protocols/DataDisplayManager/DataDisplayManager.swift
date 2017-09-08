//
//  DataDisplayManager.swift
//  FlickrPhotos
//
//  Created by Sergey Matveev on 30.06.17.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

protocol DataDisplayManager {
    
    /**
     Method return dataSource for collectionView.
     
     @param Controller collectionView.
     
     @return (UICollectionViewDataSourse)
     */
    func dataSource(for collectionView: UICollectionView) -> UICollectionViewDataSource
    
    /**
     Method returns dataSource for collectionView.
     
     @param Controller collectionView.
     @param delegate Main collection view delegate (for example, UIViewController) - needs for forwarding some collectionView methods
     
     @return (UICollectionViewDelegate)
     */
    func delegate(for collectionView: UICollectionView, withBaseDelegate delegate: PhotoSearchDataDisplayManagerDelegate) -> UICollectionViewDelegate
    
}
