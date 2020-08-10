//
//  CustomView.swift
//  Turbo Movie
//
//  Created by Febby Gumilar on 10/08/20.
//  Copyright © 2020 Slash. All rights reserved.
//

import UIKit

class CustomView: UIView {

    override func awakeFromNib() {
        self.layer.cornerRadius = 20.0
        self.layer.borderWidth = 0.5
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.clipsToBounds = true
    }

}
