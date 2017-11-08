//
//  RepositorySearchViewController.swift
//  iOSGitOverview
//
//  Created by Martin Meincke on 02/11/2017.
//  Copyright © 2017 Martin Meincke. All rights reserved.
//

import UIKit

final class RepositorySearchViewController: UIViewController {
    private let repositorySearchHandler: RepositorySearchHandler
    private var repositorySearchUIController: RepositorySearchUIController
    private let collectionView = UICollectionView(frame: .zero)
    
    init(repositorySearchHandler: RepositorySearchHandler) {
        self.repositorySearchHandler = repositorySearchHandler
        super.init(nibName: nil, bundle: nil)
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        collectionView.frame = view.frame
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(collectionView)
        
        title = "Repository Search iOS"
        
        repositorySearchUIController = RepositorySearchUIController(view: view, collectionView: collectionView)
        repositorySearchHandler.delegate = repositorySearchUIController
        
        repositorySearchHandler.fetchRepositories()
    }
}
