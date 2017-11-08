//
//  LoadingView.swift
//  iOSGitOverview
//
//  Created by Martin Meincke on 02/11/2017.
//  Copyright © 2017 Martin Meincke. All rights reserved.
//

import UIKit

final class LoadingView: UIView {
    private let spinner = UIActivityIndicatorView(activityIndicatorStyle: .gray)
    
    override init(frame: CGRect) {
        spinner.startAnimating()
        
        super.init(frame: frame)
        
        addSubview(spinner)
        backgroundColor = UIColor.white
    }
    
    @available(*, unavailable)
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        spinner.center = center
    }
}
