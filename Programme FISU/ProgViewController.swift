//
//  ProgViewController.swift
//  Programme FISU
//
//  Created by arthur jamelot on 05/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import UIKit
import CoreData

class ProgViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var tableChoix: UITableView!
    
    var choisies = [Activite]()
    
    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableChoix.delegate = self
        tableChoix.dataSource = self
        fetchChoisies()
    }
    
    func fetchChoisies(){
        let fetchRequest = NSFetchRequest(entityName: "Activite")
        let sortDescriptor = NSSortDescriptor(key : "dateDeb", ascending: true)
        let predicate = NSPredicate(format: "%K == %@", "choisie", "TRUE")
        fetchRequest.sortDescriptors = [sortDescriptor]
        fetchRequest.predicate = predicate
        do {
            let fetchResults = try self.managedObjectContext.executeFetchRequest(fetchRequest) as? [Activite]
            guard let myFetchResult = fetchResults else {
                return
            }
            choisies = myFetchResult
        } catch {
            
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.choisies.count)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("progCell")! as! ProgTableViewCell
        cell.nomProg.text = choisies[indexPath.row].nomActivite
        cell.heureDebProg.text = choisies[indexPath.row].sHeureDeb
        cell.heureFinProg.text = choisies[indexPath.row].sHeureFin
        cell.dateProg.text = choisies[indexPath.row].sDate
        return cell
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == .Delete) {
            let progItemRemove = choisies[indexPath.row]
            progItemRemove.choisie = 1
            self.fetchChoisies()
            tableChoix.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }

    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "activiteSegue") {
            let backItem = UIBarButtonItem()
            backItem.title = "Retour"
            navigationItem.backBarButtonItem = backItem
            let destination = segue.destinationViewController as! ActiviteViewController
            let index = self.tableChoix.indexPathForSelectedRow
            destination.myActivite = choisies[(index?.row)!]
        }
    }

}
