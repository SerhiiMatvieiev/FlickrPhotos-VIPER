//
//  PhotoSearchPhotoSearchViewController.swift
//  FlickrPhotos
//
//  Created by cd Sergey Matveev on 30/06/2017.
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
    
    func setupView() {
        searchBar.delegate = self
        
        collectionView.dataSource = dataDisplayManager.dataSource(for: collectionView)
        collectionView.delegate = dataDisplayManager.delegate(for: collectionView, withBaseDelegate: self)
    }
    
    func updateView(withPhotos photos: [Photo], totalPages: Int) {
        
        // update collectionView
        dataDisplayManager.updateCollectionView(withPhotos: photos, totalPages: totalPages)
    }
    
    func displayError(_ error: Error) {
        let alertController = UIAlertController(title: Alert.errorTitle, message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: Alert.OK, style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    
    func showWaitingView() {
        let alertController = UIAlertController(title: nil, message: Alert.waintingMessage, preferredStyle: .alert)
        
        alertController.view.tintColor = .black
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.activityIndicatorViewStyle = .gray
        loadingIndicator.startAnimating()
        
        alertController.view.addSubview(loadingIndicator)
        
        navigationController?.present(alertController, animated: true, completion: nil)
    }
    
    func hideWaitingView() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
    
    var photosCount: Int {
        return dataDisplayManager.photoCount
    }
    
    // MARK: - PhotoSearchDataDisplayManagerDelegate
    
    func didTapCell(withPhoto photo: Photo) {
        output.didTriggerTapCell(withPhoto: photo)
    }
    
    func searchPhotos(inPage page: Int) {
        output.searchPhotos(withTag: searchText!, page: page)
    }
    
    // MARK: - Private methods
    
    fileprivate var searchText: String? {
        didSet {
            searchPhotos(inPage: 1) // default page is 1
        }
    }

}

// MARK: - UISearchBarDelegate

extension PhotoSearchViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder()
        
        // Clear old photos
        dataDisplayManager.claerView()
        
        guard let searchText = searchBar.text else { return }
        self.searchText = searchText
    }
}
