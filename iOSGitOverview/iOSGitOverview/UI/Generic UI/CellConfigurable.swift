//
//  CellConfigurable.swift
//  iOSGitOverview
//
//  Created by Martin Meincke on 03/11/2017.
//  Copyright © 2017 Martin Meincke. All rights reserved.
//

protocol CellConfigurable {
    associatedtype Controller
    var cellController: Controller? { get set }
}
