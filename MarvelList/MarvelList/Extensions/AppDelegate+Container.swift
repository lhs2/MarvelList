//
//  AppDelegate+Container.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 12/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation
import Swinject
import SwinjectAutoregistration

extension AppDelegate {
    
    internal func setupContainer() {
        setupCoordinators()
        setupViewModels()
    }
    
    private func setupCoordinators() {
        AppDelegate.container.autoregister(AppCoordinator.self, initializer: AppCoordinator.init)
        AppDelegate.container.autoregister(HomeCoordinator.self, initializer:  HomeCoordinator.init)
        AppDelegate.container.autoregister(ComicPreviewCoordinator.self, initializer:  ComicPreviewCoordinator.init)

    }
    
    private func setupViewModels() {
        AppDelegate.container.autoregister(HomeViewModel.self, initializer: HomeViewModel.init)
        AppDelegate.container.autoregister(ComicPreviewViewModel.self, initializer: ComicPreviewViewModel.init)
    }

}
