//
//  Comic.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 12/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import Foundation

//MARK: - Comic
struct Comic: Codable {
    var id : Int?
    var digitalId: Int?
    var title: String?
    var issueNumber: Double?
    var variantDescription: String?
    var description: String?
    var modified: String?
    var isbn: String?
    var upc: String?
    var diamondCode: String?
    var ean: String?
    var issn: String?
    var format: String?
    var pageCount: Int?
    var textObjects: [TextObject]?
    var resourceURI: String?
    var urls: [ComicURL]?
    var series: SeriesSummary?
    var variants: [ComicSummary]?
    var collections: [ComicSummary]?
    var collectedIssues: [ComicSummary]?
    var dates: [ComicDate]?
    var prices: [ComicPrice]?
    var thumbnail: ComicImage?
    var images: [ComicImage]?
    var creators: CreatorList?
    var characters: CharacterList?
    var stories: StoryList?
    var events: EventList?
    
}
