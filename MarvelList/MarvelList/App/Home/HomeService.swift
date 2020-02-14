//
//  HomeService.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 12/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation
import Alamofire

class HomeService {
    
    //MARK: - Request Marvel List
    public func get(offset: Int,
        completion: @escaping (ComicDataWrapper?, CustomError?) -> Void) {
        let queryOffset = "\(offset)" as CVarArg
        let queryParameters = [queryOffset]
        Service.shared.request(.comicList,
                               queryParameters,
                               nil) { result in
                                switch result {
                                case .failure( let error):
                                    let customError = CustomError(error, type: .serviceError)
                                    
                                    completion(nil, customError)
                                case .success(let data):
                                    do {
                                        let issueList = try JSONDecoder().decode(ComicDataWrapper.self, from: data)
                                        completion(issueList, nil)
                                    } catch {
                                        completion(nil, CustomError(with:.parserError))
                                    }
                                    
                                }
                                
        }
        
    }
    
    
}
