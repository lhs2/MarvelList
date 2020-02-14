//
//  MarvelResponse.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 12/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation

//MARK: - ComicDataWrapper
struct ComicDataWrapper: Codable {

    var code : Int?
    var status : String?
    var copyright : String?
    var attributionText : String?
    var attributionHTML : String?
    var data : ComicDataContainer?
    var etag : String?
        
}
