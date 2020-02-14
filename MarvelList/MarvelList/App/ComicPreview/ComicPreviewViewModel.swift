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
    let didSelectedRow = PublishSubject<Void>()
    var comicInformation: Comic?
    
    var comicImagePath: String {
        guard let comic = comicInformation else {
            return String.Empty
        }
        let imagePath = comic.getFirstImageAvailable()
        return imagePath
    }
    
    
    func showComicInformation() {
        didSelectedRow.onNext(Void())
    }
}
