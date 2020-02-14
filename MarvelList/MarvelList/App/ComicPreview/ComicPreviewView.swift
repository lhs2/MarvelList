//
//  ComicPreviewView.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 14/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift
import Nuke
import NVActivityIndicatorView

class ComicPreviewView: UIViewController, Storyboarded {
    static var storyboard: StoryboardType = .comicPreview
    
    var viewModel : ComicPreviewViewModel?
    @IBOutlet weak var previewImage: UIImageView!
    
    override func viewDidLoad() {
        setupView()
    }
    
    private func setupView() {
        guard let viewModel = viewModel,
            let url = URL(string: viewModel.comicImagePath)else {
                return
        }

//        let request = ImageRequest(
//        url: url,
//        targetSize: CGSize(width: previewImage.bounds.width, height: previewImage.bounds.height),
//        contentMode: .aspectFill)
//
        Nuke.loadImage(with: url ,into: previewImage)
    }
    
}
