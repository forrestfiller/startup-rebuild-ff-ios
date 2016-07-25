//
//  Startup.swift
//  Startup-rebuild-FF
//
//  Created by Forrest Filler on 7/24/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

import UIKit
import Alamofire

let imageUrl = "https://ff-startups.herokuapp.com/images"

class Startup: NSObject {
    var name: String?
    var city: String?
    var imageUber: String?
    var imageXiaomi: String?
    var imageSnapChat: String?
    var imageWeWork: String?
    var imageFile: UIImage?
    var isFetching = false
    var founder: String?
    var shares: Int?
    
    enum imageUrl: String {
        case uber = "https://ff-startups.herokuapp.com/images/uber.jpg"
        case xiaomi = "https://ff-startups.herokuapp.com/images/airbnb.jpg"
        case snapChat = "https://ff-startups.herokuapp.com/images/file.jpg"
        case weWork = "https://ff-startups.herokuapp.com/images/tech.jpg"
    }
    
    func fetchImage(){
        if (self.imageFile == nil){ // no image, ignore
            return
        }
        
        if (self.isFetching == true){
            return
        }
        
        self.isFetching = true
        Alamofire.request(.GET, imageUrl.uber, parameters:nil).response { (req, res, data, error) in
            self.isFetching = false
            if (error != nil){
                return
            }
            
            if let img = UIImage(data: data!) {
                self.imageFile = img
                
                let notification = NSNotification(name:"ImageDownloaded", object:nil)
                let notificationCenter = NSNotificationCenter.defaultCenter()
                notificationCenter.postNotification(notification)
            }
        }
    }

 
    func populate(startupInfo: Dictionary<String, AnyObject>){
        self.name = startupInfo["name"] as? String
        self.city = startupInfo["city"] as? String
        self.image = startupInfo["image"] as? String
        self.founder = startupInfo["founder"] as? String
        self.shares = startupInfo["shares"] as? Int
    }

}


