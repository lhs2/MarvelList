//
//  StoryList.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 12/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation

//MARK: - StoryList
struct StoryList: Codable {
    var available: Int?
    var returned: Int?
    var collectionURI: String?
    var items: [StorySummary]?
}
