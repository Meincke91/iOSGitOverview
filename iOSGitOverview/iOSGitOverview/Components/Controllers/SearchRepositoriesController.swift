//
//  SearchRepositoriesController.swift
//  iOSGitOverview
//
//  Created by Martin Meincke on 02/11/2017.
//  Copyright © 2017 Martin Meincke. All rights reserved.
//

import Foundation

enum UIState {
    case Searching
    case Empty
    case Success([Repository])
    case Failure(Error)
}

protocol RepositorySearchDelegate: class {
    var state: UIState {get set}
}

protocol RepositorySearchHandler: class {
    var delegate: RepositorySearchDelegate? { get set }
    func fetchRepositories()
}

final class RepositorySearchController: RepositorySearchHandler {
    var delegate: RepositorySearchDelegate?
    
    func fetchRepositories() {
        guard let delegate = self.delegate else { fatalError("Delegate not found") }
        delegate.state = .Searching
    }
    
    
}
