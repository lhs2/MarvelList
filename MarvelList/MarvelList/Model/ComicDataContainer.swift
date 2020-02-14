//
//  MarvelResponseData.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 12/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//


import Foundation

//MARK: - ComicDataContainer
struct ComicDataContainer: Codable {
    var offset : Int?
    var limit : Int?
    var total : Int?
    var count : Int?
    var results : [Comic]?
        
        
}
