//
//  CellObject.swift
//  FlickrPhotos
//
//  Created by Serhii Matvieiev on 30.06.17.
//  Copyright © 2017 Serhii Matvieiev. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
