//
//  CollectionViewCell.swift
//  FlickrPhotos-VIPER
//
//  Created by Sergey Matveev on 18.03.2020.
//  Copyright © 2020 Serhii Matvieiev. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        self.initialize()
    }
    
    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.initialize()
    }
    
    open override func awakeFromNib() {
        super.awakeFromNib()
        self.reset()
    }
    
    open override func prepareForReuse() {
        super.prepareForReuse()
        self.reset()
    }
    
    // MARK: - API
    open func initialize() { }
    
    open func reset() { }
}

