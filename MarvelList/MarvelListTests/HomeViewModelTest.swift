//
//  HomeViewModelTest.swift
//  MarvelListTests
//
//  Created by Luiz Henrique de Sousa on 14/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import XCTest
@testable import MarvelList

class HomeViewModelTest: XCTestCase {
    let viewModel: HomeViewModel = HomeViewModel()
    
    override func setUp() {
        let comicList = self.loadMarvelListMock()
        viewModel.setComicList(with: comicList)
        
    }
    
    
    override func tearDown() {
        
    }
    
    func testSetSelected() {
        viewModel.setSelectedItem(by: 3)
        XCTAssertTrue(viewModel.selectedComic != nil)
        
    }
    
    func testGetComic() {
        let comic = viewModel.getComicBy(3)
        XCTAssertNotNil(comic)
    }
    
    func testGetOutOfRangeComic() {
        let comic = viewModel.getComicBy(11)
        XCTAssertNil(comic)
    }
    
    func testRequestPagination() {
        let count = viewModel.rows
        viewModel.requestPagination()
        XCTAssertTrue(count <= viewModel.rows)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
