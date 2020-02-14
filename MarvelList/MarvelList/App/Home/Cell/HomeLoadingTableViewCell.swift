//
//  HomeLoadingTableViewCell.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 13/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit
import NVActivityIndicatorView

class HomeLoadingTableViewCell: UITableViewCell {

    @IBOutlet weak var indicatorView: NVActivityIndicatorView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell() {
        indicatorView.startAnimating()
    }
    
}
