//
//  RepositoryCell.swift
//  iOSGitOverview
//
//  Created by Martin Meincke on 02/11/2017.
//  Copyright © 2017 Martin Meincke. All rights reserved.
//

import UIKit

extension RepositoryCell: Reusable {}
extension RepositoryCell: CellConfigurable {}

final class RepositoryCell: UICollectionViewCell {
    var cellController: RepositoryCellController? {
        didSet {
            guard let controller = cellController else { return }
            
            /*
            if let starsLabel = cell.viewWithTag(21) as? UILabel {
                starsLabel.text = "stars: " + String(repository.stars)
            }
            if let forkLabel = cell.viewWithTag(22) as? UILabel {
                forkLabel.text = "fork: " + String(repository.fork)
            }
            if let updatedLabel = cell.viewWithTag(23) as? UILabel {
                updatedLabel.text = "updated: " + repository.updated
            }
            if let nameLabel = cell.viewWithTag(24) as? UILabel {
                nameLabel.text = String(repository.name)
            }
            if let descriptionLabel = cell.viewWithTag(25) as? UILabel {
                descriptionLabel.text = String(repository.description)
            }*/
        }
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
