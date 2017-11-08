//
//  ViewController.swift
//  iOSGitOverview
//
//  Created by Martin Meincke on 30/10/2017.
//  Copyright © 2017 Martin Meincke. All rights reserved.
//

import UIKit

class RepositorySearchUIController {
    private unowned var view: UIView
    private let loadingView: LoadingView
    private let collectionViewDataSource: CollectionViewDataSource<RepositoryCellController, RepositoryCell>
    
    var state: UIState = .Loading {
        willSet(newState) {
            update(newState: newState)
        }
    }
    
    init(view: UIView, collectionView: UICollectionView) {
        self.view = view
        self.loadingView = LoadingView(frame: CGRect(origin: .zero, size: collectionView.frame.size))
        self.collectionViewDataSource = CollectionViewDataSource<RepositoryCellController, RepositoryCell>(collectionView: collectionView)
        
        collectionView.dataSource = collectionViewDataSource
        update(newState: state)
    }
    
}

extension RepositorySearchUIController: RepositorySearchDelegate {
    func update(newState: UIState) {
        switch (state, newState) {
            case (.Loading, .Loading):
                loadingToLoading()
            case (.Loading, .Success(let repositories)):
                loadingToSuccess(repositories: repositories)
            default:
                fatalError("Not yet implemented \(state) to \(newState)")
        }

    }
    
    func loadingToLoading() {
        view.addSubview(loadingView)
        loadingView.frame = CGRect(origin: .zero, size: view.frame.size)
    }
    
    func loadingToSuccess(repositories: [Repository]) {
        loadingView.removeFromSuperview()
        collectionViewDataSource.dataSource = repositories.map(RepositoryCellController.init)
    }
}
/*
    var searchActive : Bool = false
    
    var repositories = [
        Repository(name: "python-fire", description:"Python Fire is a library for automatically generating command line interfaces (CLIs) from absolutely any Python object.", owner:"Google", language:"Python", stars:6910, fork:339, updated:"2017-10-25" ),
        Repository(name: "yapf", description:"A formatter for Python files", owner:"Google", language:"Python", stars:5713, fork:384, updated:"2017-10-25"),
        Repository(name: "domato", description:"DOM fuzzer", owner:"Facebook", language:"Python", stars:489, fork:81, updated:"2017-10-23")
    ]
    var filteredRepositories = [Repository]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }

    func searchBarIsEmpty() -> Bool {
        return searchBar.text?.isEmpty ?? true
    }
    
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar) {
        searchActive = true;
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchActive = false;
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredRepositories = repositories.filter({( repository : Repository) -> Bool in
            return repository.owner.lowercased().contains(searchText.lowercased())
        })
        
        if(filteredRepositories.count == 0){
            searchActive = false;
        } else {
            searchActive = true;
        }
        self.collectionView.reloadData()
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func filterContentForSearchText(_ searchText: String) {
        filteredRepositories = repositories.filter({( repository : Repository) -> Bool in
            return repository.name.lowercased().contains(searchText.lowercased())
        })
        collectionView.reloadData()
    }
    
    override var prefersStatusBarHidden: Bool { return true }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchActive {
            return filteredRepositories.count
        }
        
        return repositories.count
    }
    

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CollectionViewCell", for: indexPath)
        
        let repository: Repository
        if searchActive {
            repository = filteredRepositories[indexPath.row]
        } else {
            repository = repositories[indexPath.row]
        }

        
        return cell
    }
    
    
}

extension ViewController: UISearchBarDelegate {
    // MARK: - UISearchBar Delegate
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        filterContentForSearchText(searchBar.text!)
    }
}

extension ViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchBar.text!)
    }
}
 
 */
