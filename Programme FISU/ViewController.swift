//
//  ViewController.swift
//  Programme FISU
//
//  Created by Charles on 15/03/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import UIKit
import CoreData

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
        let sortDescriptor = NSSortDescriptor(key : "date", ascending: true)
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
        cell.dateActivite.font = cell.dateActivite.font.fontWithSize(10)
        cell.nomActivite.font = cell.nomActivite.font.fontWithSize(10)
        return cell
    }
    
   // func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
       // let activiteItem = activiteItems[indexPath.row]
       // self.performSegueWithIdentifier("activiteSegue", sender: indexPath)
   // }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == .Delete) {
            let activiteItemToDelete = activiteItems[indexPath.row]
            managedObjectContext.deleteObject(activiteItemToDelete)
            self.fetchActivite()
            tableActivite.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }

    
    @IBOutlet weak var mytextField: UITextField!
    
    // MARK: TextField delegate
    func textFieldShouldReturn(textField: UITextField) ->Bool{
        self.mytextField.resignFirstResponder()
        return true
    }
    
    
    // MARK: - Navigation
    
    // In a storyboard-based application, you will often want to do a little preparation before navigation
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
    // Get the new view controller using segue.destinationViewController.
    // Pass the selected object to the new view controller.
}
    
    
    


