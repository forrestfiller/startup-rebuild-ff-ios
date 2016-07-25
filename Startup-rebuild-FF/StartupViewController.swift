//
//  StartupViewController.swift
//  Startup-rebuild-FF
//
//  Created by Forrest Filler on 7/24/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

import UIKit
import Alamofire

class StartupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var startupsTable: UITableView!
    
    /*
     
     var uber: String?
     var xiaomi: String?
     var snapchat: String?
     var weWork: String?
     
     
    */
    var startupList = Array<Startup>()
    
    func herokuRequest(startupInfo: String?){
        let url = "https://ff-startups.herokuapp.com/api/startup"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            
            if let json = response.result.value as? Dictionary<String, AnyObject>{
                if let sResults = json["results"] as? Array<Dictionary<String, AnyObject>>{
                    print("JSON PARTY, PLEASE ---->: \(sResults)")
                    for startupInfo in sResults {
                        let startup = Startup()
                        startup.populate(startupInfo)
                        self.startupList.append(startup)
                    }
                    self.startupsTable.reloadData()
                }
                
            }
            
        }
        
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        herokuRequest("")
        
        let notificationCenter = NSNotificationCenter.defaultCenter()
        notificationCenter.addObserver(
            self,
            selector: #selector(StartupViewController.imageDownloadedNotification(_:)),
            name: "ImageDownloaded",
            object: nil
        )
    }

    func imageDownloadedNotification(notification: NSNotification){
        print("imageDownloadedNotification")
        
        self.startupsTable.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.startupList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let startup = startupList[indexPath.row]
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            configureCell(cell, indexPath: indexPath)
            return cell
        }
        
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        configureCell(cell, indexPath: indexPath)
        return cell
    }
    
    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
            let startup = startupList[indexPath.row]
            cell.textLabel?.text = startup.name! + "  ---  " + "Headquarters: " + startup.city!
            cell.detailTextLabel?.text = "Founder: " + startup.founder!
        if (startup.image?.characters.count == 0){
            return cell
        }
        if (startup.image != nil){
            cell.imageView?.image = startup.image
            return cell
        }
            startup.fetchImage()
            return cell
    }

    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
    }

    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow!, animated: true)
    }
    
    
//              Fin.
}


