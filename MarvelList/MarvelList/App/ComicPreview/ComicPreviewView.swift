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
        //Image loading
        ImagePipeline.shared.loadImage(
            with: url,
            progress: nil) {
                response, error in
                if error != nil {
                    let err = CustomError.init(with: .imageError)
                    self.alert(title: "ERROR_TITLE".localized, error: err.description(), buttonTexts: ["BTN_OK".localized])
                } else {
                    self.previewImage.image = response?.image
                    self.previewImage.contentMode = .scaleAspectFit

                }
                
        }
        Nuke.loadImage(with: url ,into: previewImage)
        
        //Image Tappable
        previewImage.isUserInteractionEnabled = true
        
        let tapRecognizer = UITapGestureRecognizer(target: self, action: #selector(tapAction(tapGestureRecognizer:)))
         previewImage.addGestureRecognizer(tapRecognizer)
    }
    
    @objc func tapAction(tapGestureRecognizer: UITapGestureRecognizer)
    {
        guard let _ = tapGestureRecognizer.view as? UIImageView, let viewModel = viewModel else { return }
        
        viewModel.showComicInformation()
    }
    
}
