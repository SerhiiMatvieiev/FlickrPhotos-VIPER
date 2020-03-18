//
//  PhotoSearchCell.swift
//  FlickrPhotos-VIPER
//
//  Created by Sergey Matveev on 18.03.2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import UIKit
import Kingfisher

class PhotoSearchCell: CollectionViewCell {
    
    // MARK: Public
    func configure(withPhoto photo: PhotoVM) {
        imageView.kf.setImage(with: photo.photoURL, options: [.transition(.fade(0.2))])
    }
    
    // MARK: Subviews
    private lazy var imageView: UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleAspectFill
        iv.layer.masksToBounds = true
        return iv
    }()

    override func initialize() {
        setupUI()
    }
    
    // MARK: Private
    private func setupUI() {
        addSubview(imageView)
        imageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
