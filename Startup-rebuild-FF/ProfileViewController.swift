//
//  ProfileViewController.swift
//  Startup-rebuild-FF
//
//  Created by Forrest Filler on 7/24/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var profilesTable: UITableView!
    
    var profileList = Array<Profile>()
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellId = "cellId"
        if let cell = tableView.dequeueReusableCellWithIdentifier(cellId){
            cell.textLabel?.text = "\(indexPath.row)"
            return cell
        }
        let cell = UITableViewCell(style: .Subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    
//    func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
//        let profile = profileList[indexPath.row]
//        cell.textLabel?.text = profile.firstname! + " " + profile.lastname!
//        cell.detailTextLabel?.text = profile.email
//        return cell
//    }
    


    
//          Fin.
}




