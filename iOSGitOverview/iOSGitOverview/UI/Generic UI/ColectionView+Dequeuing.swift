//
//  ColectionView+Dequeuing.swift
//  iOSGitOverview
//
//  Created by Martin Meincke on 03/11/2017.
//  Copyright © 2017 Martin Meincke. All rights reserved.
//

import UIKit

protocol Reusable: class {
    static var reusableIdentifier: String { get }
}

extension Reusable {
    static var reusableIdentifier: String { return String(describing: self) }
}

extension UICollectionView {
    func registerReusableCell<T: UICollectionViewCell>(_: T.Type) where T: Reusable {
        register(T.self, forCellWithReuseIdentifier: T.reusableIdentifier)
    }
    
    func dequeueReusableCell<T: UICollectionViewCell>(indexPath: IndexPath) -> T where T: Reusable {
        let cell = dequeueReusableCell(withReuseIdentifier: T.reusableIdentifier, for: indexPath) as! T
        return cell
    }
}
