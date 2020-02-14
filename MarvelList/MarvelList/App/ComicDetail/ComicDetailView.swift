//
//  ComicDetailView.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 14/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import NVActivityIndicatorView

class ComicDetailView: UIViewController, Storyboarded {
    static var storyboard: StoryboardType = .comicDetail
    
    var viewModel : ComicDetailViewModel?
}
