//
//  RepositoryCellController.swift
//  iOSGitOverview
//
//  Created by Martin Meincke on 02/11/2017.
//  Copyright © 2017 Martin Meincke. All rights reserved.
//

protocol RepositoryCellRepresentable {
    var name: String { get}
    var description: String { get }
    var owner: String { get }
    var language: String { get }
    var stars: Int { get }
    var fork: Int { get }
    var updated: String { get }
}

struct RepositoryCellController: RepositoryCellRepresentable {
    let name: String
    let description: String
    let owner: String
    let language: String
    let stars: Int
    let fork: Int
    let updated: String
    
    init(repository: Repository) {
        self.name = repository.name
        self.description = repository.description
        self.owner = repository.owner
        self.language = repository.language
        self.stars = repository.stars
        self.fork = repository.fork
        self.updated = repository.updated
    }
}
