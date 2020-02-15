//
//  ComicPreviewViewModelTest.swift
//  MarvelListTests
//
//  Created by Luiz Henrique de Sousa on 14/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import XCTest
@testable import MarvelList

class ComicPreviewViewModelTest: XCTestCase {
    let viewModel = ComicPreviewViewModel()
    
    override func setUp() {
        guard let url = Bundle.main.url(forResource: "Mock", withExtension: "json") else {
            XCTFail("Missing file: Mock.json")
            return
        }
        do {
            let data = try Data(contentsOf: url)
            let comicData = try JSONDecoder().decode(ComicDataWrapper.self, from: data)
            guard let comicResult = comicData.data,
                let comicList = comicResult.results else {
                    XCTFail("Missing Comic List")
                    return
            }
            XCTAssertTrue(comicList.count > 0)
            guard let comicInformation = comicList.first else {
                XCTFail("Failed when tried to obtain the first comic item")
                return
            }
            viewModel.comicInformation = comicInformation
            
        } catch {
            XCTFail("Failed in parsing File with: \(error.localizedDescription)")
        }
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetImagePath() {
        let path = viewModel.comicImagePath
        XCTAssertNotEqual(path, String.Empty)
    }
    
    func testGetImagePathEmpty() {
        viewModel.comicInformation = nil
        let path = viewModel.comicImagePath
        XCTAssertEqual(path, String.Empty)
    }
    
    func testShowComicInformation(){
        viewModel.showComicInformation()
        XCTAssertTrue(true)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
