//
//  CustomError.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 12/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation
//MARK: - CustomError
public struct CustomError : Error {
    public enum CustomErrorType {
        case serviceError
        case unknownError
        case connectionError
        case invalidRequest
        case notFound
        case parserError
        case imageError
    }
    
    init(_ error: Error, type: CustomErrorType = .notFound) {
        self.localizedDescription = error.localizedDescription
        self.errorType = type
    }
    
    init(with type: CustomErrorType = .notFound) {
        self.localizedDescription = String.Empty
        self.errorType = type
    }
    //Static versions
    
    var localizedDescription: String
    var errorType: CustomErrorType = .notFound
    
    func description() -> String {
        switch self.errorType {
        case .serviceError:
            return self.localizedDescription
        case .unknownError:
            return "ERROR_UNKNOWN".localized
        case .connectionError:
            return "ERROR_CONNECTION".localized
        case .invalidRequest:
            return "ERROR_INTERNAL".localized
        case .notFound:
            return "ERROR_UNKNOWN".localized
        case .parserError:
            return "ERROR_PARSE".localized
        case .imageError:
            return "ERROR_COMIC_IMAGE".localized
        }
    }
    
}
