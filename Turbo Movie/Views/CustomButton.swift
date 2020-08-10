//
//  CustomButton.swift
//  Turbo Movie
//
//  Created by Febby Gumilar on 10/08/20.
//  Copyright © 2020 Slash. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    override func awakeFromNib() {
        self.layer.cornerRadius = 20.0
        self.clipsToBounds = true
    }

}
