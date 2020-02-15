//
//  XCTestCase+Mock.swift
//  MarvelListTests
//
//  Created by Luiz Henrique de Sousa on 15/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import XCTest
@testable import MarvelList

extension XCTestCase {
    func loadMarvelListMock() -> [Comic] {
        guard let url = Bundle.main.url(forResource: "Mock", withExtension: "json") else {
            XCTFail("Missing file: Mock.json")
            return []
        }
        do {
            let data = try Data(contentsOf: url)
            let comicData = try JSONDecoder().decode(ComicDataWrapper.self, from: data)
            guard let comicResult = comicData.data,
                let comicList = comicResult.results else {
                    XCTFail("Missing Comic List")
                    return []
            }
            XCTAssertTrue(comicList.count > 0)
            
            return comicList
        } catch {
            XCTFail("Failed in parsing File with: \(error.localizedDescription)")
        }
        return []
    }
}
