//
//  CellObject.swift
//  FlickrPhotos
//
//  Created by Sergey Matveev on 30.06.17.
//  Copyright © 2017 GNS-IT. All rights reserved.
//

import UIKit

protocol ReusableView: class {
    /**
     @author Serhii Matvieiev
     Return cell identifier
     */
    static var reuseIdentifier: String { get }
}

extension ReusableView where Self: UIView {
    
    static var reuseIdentifier: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }
}
