//
//  CollectionViewDataSource.swift
//  iOSGitOverview
//
//  Created by Martin Meincke on 05/11/2017.
//  Copyright © 2017 Martin Meincke. All rights reserved.
//

import UIKit

final class CollectionViewDataSource<Model, Cell: UICollectionViewCell>: NSObject, UICollectionViewDataSource where Cell: Reusable, Cell: CellConfigurable, Model == Cell.Controller {
    
    var dataSource: [Model] = [] {
        didSet { collectionView.reloadData() }
    }
    
    private unowned var collectionView: UICollectionView
    
    init(collectionView: UICollectionView) {
        self.collectionView = collectionView
        
        collectionView.registerReusableCell(Cell.self)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        var cell: Cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath) as! Cell
        cell.cellController = dataSource[indexPath.row]
        return cell
        
    }
}
