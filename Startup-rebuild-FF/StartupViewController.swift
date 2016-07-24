//
//  StartupViewController.swift
//  Startup-rebuild-FF
//
//  Created by Forrest Filler on 7/24/16.
//  Copyright © 2016 forrestfiller. All rights reserved.
//

import UIKit

class StartupViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet var startupsTable: UITableView!
    
    var startupList = Array<Startup>()

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 40
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
    
    
//        func configureCell(cell: UITableViewCell, indexPath: NSIndexPath) -> UITableViewCell {
//            let startup = startupList[indexPath.row]
//            cell.textLabel?.text = "Startup: " + startup.name! + ", " + "Headquarters: " + startup.city!
//            cell.detailTextLabel?.text = "Founder: " + startup.founder!
//            return cell
//        }
    

    
    
    
//              Fin.
}


