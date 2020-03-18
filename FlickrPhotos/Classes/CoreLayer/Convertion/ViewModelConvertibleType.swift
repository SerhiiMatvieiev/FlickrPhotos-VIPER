//
//  ViewModelConvertibleType.swift
//  Nebula
//
//  Created by Sergey Matveev on 4/12/19.
//  Copyright © 2019 Serhii Matvieiev. All rights reserved.
//

import Foundation

public protocol ViewModelConvertible {
    associatedtype ViewModel
    
    func asViewModel() -> ViewModel
}

public extension Collection where Iterator.Element: ViewModelConvertible {
    typealias Element = Iterator.Element
    func mapToViewModel() -> [Element.ViewModel] {
        return compactMap {
            return $0.asViewModel()
        }
    }
}
