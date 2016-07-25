//
//  ProfileViewController.swift
//  Startup-rebuild-FF
//
//  Created by Forrest Filler on 7/24/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

import UIKit
import Alamofire

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var profilesTable: UITableView!
    
    var profileList = Array<Profile>()
    
    func herokuRequest(profileInfo: String?){
        let url = "https://ff-startups.herokuapp.com/api/profile"
        
        Alamofire.request(.GET, url, parameters: nil).responseJSON { response in
            
            if let json = response.result.value as? Dictionary<String, AnyObject>{
                //print("api did call: \(json)")
                if let pResults = json["results"] as? Array<Dictionary<String, AnyObject>>{
                    print("json['results']: \(pResults)")
                    for profileInfo in pResults {
                        let profile = Profile()
                        profile.populate(profileInfo)
                        self.profileList.append(profile)
                    }
                    self.profilesTable.reloadData()
                }
                
            }
            
        }
        
    }

    override func viewDidLoad() {
        self.herokuRequest("")
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.profileList.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let profile = profileList[indexPath.row]
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
        let profile = profileList[indexPath.row]
        cell.textLabel?.text = profile.firstname! + " " + profile.lastname!
        cell.detailTextLabel?.text = profile.email
        return cell
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 88
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        tableView.deselectRowAtIndexPath(tableView.indexPathForSelectedRow!, animated: true)
    }
    


    
//          Fin.
}




