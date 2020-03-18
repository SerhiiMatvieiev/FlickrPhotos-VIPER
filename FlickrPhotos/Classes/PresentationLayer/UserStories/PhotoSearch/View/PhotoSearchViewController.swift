//
//  PhotoSearchViewController.swift
//  FlickrPhotos-VIPER
//
//  Created by Serhii Matvieiev on 18/03/2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import UIKit

class PhotoSearchViewController: UIViewController {

    // MARK: Dependencies
    var output: PhotoSearchViewOutput!
    var dataDisplayManager: PhotoSearchDataDisplayManager!

    // MARK: Subviews
    private lazy var searchBar: UISearchBar = {
        let sb = UISearchBar()
        sb.delegate = self
        return sb
    }()
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .white
        cv.dataSource = dataDisplayManager.dataSource(for: cv)
        cv.delegate = dataDisplayManager.delegate(for: cv, withBaseDelegate: self)
        return cv
    }()
    
    // MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        output.viewIsReady()
    }
    
    // MARK: Private
    private func setupUI() {
        view.addSubview(searchBar)
        searchBar.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalTo(view.snp.topMargin)
            $0.right.equalToSuperview()
        }
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.left.equalToSuperview()
            $0.top.equalTo(searchBar.snp.bottom)
            $0.right.equalToSuperview()
            $0.bottom.equalTo(view.snp.bottomMargin)
        }
    }
}

// MARK: - PhotoSearchViewInput
extension PhotoSearchViewController: PhotoSearchViewInput {
    func setupInitialState() {
        view.backgroundColor = .white
        title = "Flickr Photos"
        setupUI()
    }
    func updateView(withPhotos photos: [PhotoVM], hasMore: Bool) {
        dataDisplayManager.update(withPhotos: photos, hasMore: hasMore)
    }
    func displayError(_ error: Error) {
        let alertController = UIAlertController(title: Alert.Title.error, message: error.localizedDescription, preferredStyle: .alert)
        let action = UIAlertAction(title: Alert.Button.ok, style: .default, handler: nil)
        alertController.addAction(action)
        present(alertController, animated: true, completion: nil)
    }
    func showWaitingLoader() {
        let alertController = UIAlertController(title: nil, message: Alert.Message.wainting, preferredStyle: .alert)
        alertController.view.tintColor = .black
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.style = .gray
        loadingIndicator.startAnimating()
        alertController.view.addSubview(loadingIndicator)
        navigationController?.present(alertController, animated: true, completion: nil)
    }
    func hideWaitingLoader() {
        navigationController?.dismiss(animated: true, completion: nil)
    }
}

// MARK: - UISearchBarDelegate

extension PhotoSearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = searchBar.text else { return }
        searchBar.resignFirstResponder()
        dataDisplayManager.clearView()
        output.search(tag: searchText)
    }
}

// MARK: - PhotoSearchDataDisplayManagerDelegate
extension PhotoSearchViewController: PhotoSearchDataDisplayManagerDelegate {
    func didSelectPhoto(at index: Int) {
        output.openPhoto(at: index)
    }
    func loadMore() {
        output.loadMorePhotos()
    }
}
