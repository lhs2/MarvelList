//
//  ComicPreviewCoordinator.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 14/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxSwift

class ComicPreviewCoordinator: BaseCoordinator {
    
    private let viewModel: ComicPreviewViewModel
    private let disposebag = DisposeBag()
    
    init(viewModel: ComicPreviewViewModel) {
        self.viewModel = viewModel
    }
    
    override func start() {
        let viewController = ComicPreviewView.instantiate()
        viewController.viewModel = viewModel
        
        self.navigationController.isNavigationBarHidden = false
        self.navigationController.viewControllers = [viewController]
    }
    
}
