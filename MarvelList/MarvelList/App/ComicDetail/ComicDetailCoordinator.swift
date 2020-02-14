//
//  ComicDetailCoordinator.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 14/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxSwift

class ComicDetailCoordinator: BaseCoordinator {
    
    private let viewModel: ComicDetailViewModel
    private let disposebag = DisposeBag()
    
    init(viewModel: ComicDetailViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = ComicDetailView.instantiate()
        viewController.viewModel = viewModel
        
        self.navigationController.isNavigationBarHidden = false
        self.navigationController.viewControllers = [viewController]
    }
    
}
