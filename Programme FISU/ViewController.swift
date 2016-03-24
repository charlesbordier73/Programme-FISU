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

    //create empty array of Conferencier
    var conferencierItems = [Conferencier]()


    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // Use optional binding to confirm the the manageObjectContext

            
            //create some dummy data to work with
            var items = [
                ("Anakin Skywalker","Sith"),
                ("Tintin","Reporter"),
                ("Spyro","Dragon")
            ]
            
            //loop through, creating items
            for (itemNom, itemMetier) in items {
                //create an individual item
                Conferencier.createInManagedObjectContext(self.managedObjectContext, nom: itemNom, metier: itemMetier)
            }
        
        tableConferencier.registerClass(UITableViewCell.classForCoder(), forCellReuseIdentifier: "ConferencierCell")
        tableConferencier.dataSource = self
        tableConferencier.delegate = self
        fetchConferencier()
    }

    func fetchConferencier(){
        let fetchRequest = NSFetchRequest(entityName: "Conferencier")
        let sortDescriptor = NSSortDescriptor(key : "nom", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
            do {
            let fetchResults = try self.managedObjectContext.executeFetchRequest(fetchRequest) as? [Conferencier]
            conferencierItems = fetchResults!
        } catch {
            
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: UITableViewDelegate

    @IBOutlet weak var tableConferencier: UITableView!
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.conferencierItems.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ConferencierCell")! as UITableViewCell
        cell.textLabel?.text = self.conferencierItems[indexPath.row].nom
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let conferencierItem = conferencierItems[indexPath.row]
        print(conferencierItem.metier)
    }
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if(editingStyle == .Delete) {
            let conferencierItemToDelete = conferencierItems[indexPath.row]
            managedObjectContext.deleteObject(conferencierItemToDelete)
            self.fetchConferencier()
            tableConferencier.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Automatic)
        }
    }
}

