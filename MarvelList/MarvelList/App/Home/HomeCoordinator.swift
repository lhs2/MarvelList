//
//  HomeCoordinator.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 12/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxSwift

class HomeCoordinator: BaseCoordinator {
    
    private let viewModel: HomeViewModel
    private var comicPreviewViewModel: ComicPreviewViewModel
    private let disposebag = DisposeBag()
    
    init(viewModel: HomeViewModel, comicPreviewViewModel: ComicPreviewViewModel) {
        self.viewModel = viewModel
        self.comicPreviewViewModel = comicPreviewViewModel
    }
    
    override func start() {
        self.setUpBindings()
        
        let viewController = HomeView.instantiate()
        viewController.viewModel = viewModel
        
        self.navigationController.isNavigationBarHidden = false
        self.navigationController.viewControllers = [viewController]
    }
    
    
    private func didSelectComic() {
        let coordinator: ComicPreviewCoordinator = AppDelegate.container.resolve(ComicPreviewCoordinator.self)!
        coordinator.navigationController = self.navigationController
        
        comicPreviewViewModel.comicInformation = viewModel.selectedComic
        coordinator.prepare(for: comicPreviewViewModel)
        
        start(coordinator: coordinator)
        

    }
    
    private func setUpBindings() {
        self.viewModel.didSelectedRow
            .subscribe(onNext: { [weak self] in self?.didSelectComic() })
            .disposed(by: self.disposebag)
        
    }
    
}
