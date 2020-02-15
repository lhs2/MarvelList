//
//  BaseService.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 12/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation

import Foundation
import Alamofire

class Service {
    
    enum Result<Value, Error: Swift.Error> {
        case success(Data)
        case failure(Error)
    }
    
    typealias Handler = (Result<Data, Error>) -> Void
    
    
    static let shared: Service = Service()
    
    private init() {
        manager = Alamofire.Session()
    }
    
    static let baseURL = "https://gateway.marvel.com/v1/"
    static let apiKeyPublic = "e65e18d826993d6c5f0bfecd1dbb171f"
    static let apiKeyPrivate = "a583bb4154494bc3984ff976ba777a6a41c64b7f"
    private let manager: Alamofire.Session!
    
    
    enum Endpoint: String {
        case comicList = "Get Comic List"
        
        
        internal var method: HTTPMethod {
            switch self {
            case .comicList      : return .get
                
            }
        }
        
        fileprivate var URL: String{
            switch self {
            case .comicList:
                let timestamp = "\(Date.timestamp)"
                let hash = Data.MD5(timestamp: timestamp, privateKey: Service.apiKeyPrivate, publicKey: Service.apiKeyPublic) .map { String(format: "%02hhx", $0) }.joined()
                return "public/comics?noVariants=true&offset=%@&limit=50&apikey=\(Service.apiKeyPublic)&ts=\(timestamp)&hash=\(hash)"
            }
        }
        
        
        fileprivate var headers: HTTPHeaders {
            switch self {
            case .comicList:
                return [
                    "Accept": "application/json"
                ]
                
            }
        }
        
        
    }
    
    func request(_ endpoint        : Endpoint,
                 _ pathParamenters : [CVarArg]?,
                 _ parameters      : [String:Any]?,
                 handler: @escaping Handler) {
        
        var requestURL = Service.baseURL + endpoint.URL
        
        if pathParamenters != nil && (pathParamenters?.count)! > 0 {
            requestURL = String.init(format: requestURL, arguments: pathParamenters!)
        }
        
        let encoding: ParameterEncoding = JSONEncoding.default
        manager.request(requestURL, method: endpoint.method, parameters: parameters, encoding: encoding, headers: endpoint.headers)
            .responseJSON(completionHandler: { response in
                switch response.result {
                case .success(_):
                    if let data = response.data {
                        handler(.success(data))
                    }
                    
                case .failure(let error):
                    handler(.failure(error))
                    
                }
            })
        
    }
    
    
}
