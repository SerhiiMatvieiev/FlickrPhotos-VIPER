//
//  File.swift
//  FlickrPhotos
//
//  Created by Serhii Matvieiev on 30.06.17.
//  Copyright © 2017 Serhii Matvieiev. All rights reserved.
//

import UIKit

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
