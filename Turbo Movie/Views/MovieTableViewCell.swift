//
//  MovieTableViewCell.swift
//  Turbo Movie
//
//  Created by Febby Gumilar on 10/08/20.
//  Copyright © 2020 Slash. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    
    @IBOutlet var viewContainer: UIView!
    @IBOutlet var movieImage: UIImageView!
    @IBOutlet var movieTitle: UILabel!
    @IBOutlet var movieGenre: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        initialize()
    }
    
    func initialize() {
        self.viewContainer.layer.cornerRadius = 5.0
        self.viewContainer.layer.shadowColor = UIColor.lightGray.cgColor
        self.viewContainer.layer.shadowOpacity = 0.5
        self.viewContainer.layer.shadowOffset = .zero
        self.viewContainer.layer.shadowRadius = 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
