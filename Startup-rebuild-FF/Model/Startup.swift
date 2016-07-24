//
//  Startup.swift
//  Startup-rebuild-FF
//
//  Created by Forrest Filler on 7/24/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

import UIKit

class Startup: NSObject {
    var name: String?
    var city: String?
    var image: String?
    var founder: String?
    var shares: Int?
    
    func populate(profileInfo: Dictionary<String, AnyObject>){
        self.name = profileInfo["name"] as? String
        self.city = profileInfo["city"] as? String
        self.image = profileInfo["image"] as? String
        self.founder = profileInfo["founder"] as? String
        self.shares = profileInfo["shares"] as? Int
    }

}
