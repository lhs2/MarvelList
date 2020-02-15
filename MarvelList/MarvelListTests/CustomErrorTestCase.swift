//
//  CustomErrorTestCase.swift
//  MarvelListTests
//
//  Created by Luiz Henrique de Sousa on 15/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import XCTest
@testable import MarvelList

class CustomErrorTestCase: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testErrorUnknown() {
        let err = CustomError.init(with: .unknownError)
        XCTAssertEqual(err.description(), "ERROR_UNKNOWN".localized)
    }
    
    func testErrorConnection() {
        let err = CustomError.init(with: .connectionError)
        XCTAssertEqual(err.description(), "ERROR_CONNECTION".localized)
    }
    
    func testErrorInvalid() {
        let err = CustomError.init(with: .invalidRequest)
        XCTAssertEqual(err.description(), "ERROR_INTERNAL".localized)
    }
    
    func testErrorNotFound() {
        let err = CustomError.init(with: .notFound)
        XCTAssertEqual(err.description(), "ERROR_UNKNOWN".localized)
    }
    
    
    func testErrorParse() {
        let err = CustomError.init(with: .parserError)
        XCTAssertEqual(err.description(), "ERROR_PARSE".localized)
    }
    
    func testErrorImage() {
        let err = CustomError.init(with: .imageError)
        XCTAssertEqual(err.description(), "ERROR_COMIC_IMAGE".localized)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
