//
//  PhotoLoadingCell.swift
//  FlickrPhotos-VIPER
//
//  Created by Sergey Matveev on 18.03.2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import UIKit
import SnapKit

class PhotoLoadingCell: CollectionViewCell {
    
    // MARK: Subviews
    private var activityIndicator: UIActivityIndicatorView = {
        let ai = UIActivityIndicatorView()
        ai.startAnimating()
        return ai
    }()
    
    // MARK: Initialize
    override func initialize() {
        setupUI()
    }
    
    override func reset() {
        activityIndicator.startAnimating()
    }
    
    // MARK: Private
    private func setupUI() {
        addSubview(activityIndicator)
        activityIndicator.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
}
