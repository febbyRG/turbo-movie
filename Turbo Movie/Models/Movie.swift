//
//  Movie.swift
//  Turbo Movie
//
//  Created by Febby Gumilar on 10/08/20.
//  Copyright © 2020 Slash. All rights reserved.
//

import UIKit

class Movie: NSObject {

    var id : Int
    var title: String
    var cover: String
    var genre: String
    var genres: [String]
    var rating: NSNumber
    
    init?(data: Dictionary<String, AnyObject>){
        
        // Initialize stored properties.
        self.id         = data["id"] as! Int
        self.title      = data["title"] as! String
        self.cover      = data["medium_cover_image"] as! String
        self.rating     = data["rating"] as! NSNumber
        
        let genres      = data["genres"] as! [String]
        self.genres     = genres
        self.genre      = String()
        
        for x in 0..<genres.count {
            self.genre += genres[x]
            if x != genres.count - 1 {
                self.genre += " | "
            }
        }
        
    }
    
}
