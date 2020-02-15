//
//  ViewControllerTest.swift
//  MarvelListTests
//
//  Created by Luiz Henrique de Sousa on 15/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import XCTest
@testable import MarvelList

class ViewControllerTest: XCTestCase {
    
    override func setUp() {
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testAppCoordinator() {
        let appCoordinator = AppCoordinator.init()
        appCoordinator.start()
        
    }
    
    func testHomeCoordinator() {
        let homeViewModel = HomeViewModel.init()
        homeViewModel.setComicList(with: self.loadMarvelListMock())
        
        let comicPreviewViewModel = ComicPreviewViewModel.init()
        if let comic = homeViewModel.getComicBy(0) {
            comicPreviewViewModel.comicInformation = comic
        }
        
        let homeCoordinator = HomeCoordinator.init(viewModel: homeViewModel, comicPreviewViewModel: comicPreviewViewModel)
        
        homeCoordinator.start()
        
        homeViewModel.setSelectedItem(by: 0)
        
    }
    
    func testComicCoordinator() {
        let comicPreviewViewModel = ComicPreviewViewModel.init()
        let comicList = self.loadMarvelListMock()
        
        if comicList.count > 0 , let comic = comicList.first {
            comicPreviewViewModel.comicInformation = comic
        }
        
        let comicCoordinator = ComicPreviewCoordinator.init(viewModel: comicPreviewViewModel)
        comicCoordinator.start()
        
        
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
