//
//  ComicPreviewViewModel.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 14/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxSwift

class ComicPreviewViewModel {
    var comicInformation: Comic?
    
    var comicImagePath: String {
        guard let comic = comicInformation else {
            return ""
        }
        let imagePath = comic.getFirstImageAvailable()
        return imagePath
    }
    
}
