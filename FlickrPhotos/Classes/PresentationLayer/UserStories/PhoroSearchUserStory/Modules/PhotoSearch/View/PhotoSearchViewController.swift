//
//  PhotoSearchPhotoSearchViewController.swift
//  FlickrPhotos
//
//  Created by cd /Users/mac/Desktop/FlickrPhotos/ on 30/06/2017.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

class PhotoSearchViewController: UIViewController, PhotoSearchViewInput, PhotoSearchDataDisplayManagerDelegate {

    var output: PhotoSearchViewOutput!
    var dataDisplayManager: PhotoSearchDataDisplayManager!

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var collectionView: UICollectionView!
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }

    // MARK: PhotoSearchViewInput
    func setupViewWithEventList(photos: [Photo]) {
        setupInitialState()
        
        collectionView.dataSource = dataDisplayManager.dataSource(for: collectionView)
        collectionView.delegate = dataDisplayManager.delegate(for: collectionView, withBaseDelegate: self)

        // update collectionView
        dataDisplayManager.updateCollectionView(withPhotos: photos)
    }
    
    private func setupInitialState() {
        print("setup initial state")
    }
    
    // MARK: - PhotoSearchDataDisplayManagerDelegate
    
    func didTapCell(withPhoto photo: Photo) {
        print(photo.color.debugDescription)
    }
}
