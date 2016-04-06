//
//  ViewController.swift
//  Programme FISU
//
//  Created by Charles on 15/03/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import UIKit
import CoreData
import MapKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    //create empty array of Activite
    var activiteItems = [Activite]()

    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let firstStart : Bool? = NSUserDefaults.standardUserDefaults().objectForKey("firstStart") as? Bool
        if firstStart == nil || firstStart == true {
            Instanciate.instance()
        }
        
        
        
        tableActivite.dataSource = self
        tableActivite.delegate = self
        fetchActivite()
    }

    func fetchActivite(){
        let fetchRequest = NSFetchRequest(entityName: "Activite")
        let sortDescriptor = NSSortDescriptor(key : "dateDeb", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
            do {
            let fetchResults = try self.managedObjectContext.executeFetchRequest(fetchRequest) as? [Activite]
            guard let myFetchResult = fetchResults else {
                return
                }
            activiteItems = myFetchResult
        } catch {
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableViewDelegate

    @IBOutlet weak var tableActivite: UITableView!

    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.activiteItems.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ActivityCellID") as! AccueilTableViewCell
        cell.nomActivite.text = self.activiteItems[indexPath.row].nomActivite
        cell.dateActivite.text = self.activiteItems[indexPath.row].sDate
        return cell
    }
    
    func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]? {
        let select = UITableViewRowAction(style: .Normal, title: "Select",  handler: {action, index in
            let addToProg = self.activiteItems[indexPath.row]
            addToProg.choisie = 0
            try! self.managedObjectContext.save()
            self.tableActivite.reloadData()
        })
        select.backgroundColor = UIColor.blueColor()
        return [select]
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    }


    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "activiteSegue") {
            let backItem = UIBarButtonItem()
            backItem.title = "Retour"
            navigationItem.backBarButtonItem = backItem
            let destination = segue.destinationViewController as! ActiviteViewController
            let index = self.tableActivite.indexPathForSelectedRow
            destination.myActivite = activiteItems[(index?.row)!]
        }
    }
}
    
    
    


