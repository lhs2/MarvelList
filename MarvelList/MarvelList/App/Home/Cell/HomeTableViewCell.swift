//
//  HomeTableViewCell.swift
//  MarvelList
//
//  Created by Luiz Henrique de Sousa on 13/02/20.
//  Copyright © 2020 Luiz Henrique. All rights reserved.
//

import UIKit

class HomeTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //MARK: - Cell configuration
    func configureCell() {
        titleLabel.text = "No title available for this comic"
        titleLabel.textColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
    }
    
    func configureCell(with comic: Comic) {
        
        if let comicTitle = comic.title {
            titleLabel.text = comicTitle
        }
    }
    
    
}
