//
//  PhotoSearchDataDisplayManager.swift
//  FlickrPhotos
//
//  Created by Sergey Matveev on 30.06.17.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

protocol PhotoSearchDataDisplayManagerDelegate: class {

    /**
     Notify when cell pressed
     */
    func didTapCell(withPhoto photo: Photo)
    
    /**     
     Search photos in page
     
     @param tag is photo name
     
     @param page is page number
     */
    func searchPhotos(inPage page: Int)
    
}

class PhotoSearchDataImplementation: NSObject, PhotoSearchDataDisplayManager {
    
    weak var delegate: PhotoSearchDataDisplayManagerDelegate!
    
    // MARK: - PhotoSearchDataDisplayManager
    
    func dataSource(for collectionView: UICollectionView) -> UICollectionViewDataSource {
        collectionView.registerCellNib(PhotoSearchCell.self)
        collectionView.registerCellNib(PhotoLoadingCell.self)
        self.collectionView = collectionView
        return self
    }

    func delegate(for collectionView: UICollectionView, withBaseDelegate delegate: PhotoSearchDataDisplayManagerDelegate) -> UICollectionViewDelegate {
        self.delegate = delegate
        return self
    }

    func updateCollectionView(withPhotos photos: [Photo], totalPages: Int) {
        self.photos.append(contentsOf: photos)
        self.totalPages = totalPages
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func claerView() {
        photos.removeAll()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    var photoCount: Int {
        return photos.count
    }
    
    // MARK: - Private implementations
    
    private var collectionView: UICollectionView!
    
    fileprivate var currentPage = 1
    fileprivate var totalPages = 1
    fileprivate var photos: [Photo] = []
}

// MARK: - UICollectionViewDataSource

extension PhotoSearchDataImplementation: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return currentPage < totalPages ? photos.count + 1 : photos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.item < photos.count {
            return photoCell(collectionView, cellForItemAt: indexPath)
        } else {
            currentPage += 1
            delegate?.searchPhotos(inPage: currentPage)
            return loadingCell(collectionView, cellForItemAt: indexPath)
        }
    }
    
    func photoCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoSearchCell.reuseIdentifier, for: indexPath) as! PhotoSearchCell
        
        cell.photo = photos[indexPath.item]
        
        return cell
    }
    
    func loadingCell(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoLoadingCell.reuseIdentifier, for: indexPath) as! PhotoLoadingCell
        
        
        return cell
    }
}

// MARK: - UICollectionViewDelegate

extension PhotoSearchDataImplementation: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collectionView.deselectItem(at: indexPath, animated: true)
        guard let cell = collectionView.cellForItem(at: indexPath) as? PhotoSearchCell,
            let photo = cell.photo else { return }
        delegate.didTapCell(withPhoto: photo)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotoSearchDataImplementation: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        if indexPath.item < photos.count {
            let size = collectionView.bounds.width / 3 - 2
            return CGSize(width: size, height: size)
        } else {
            return CGSize(width: collectionView.bounds.width, height: 100)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
}
