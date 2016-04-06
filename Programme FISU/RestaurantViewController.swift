//
//  RestaurantViewController.swift
//  Programme FISU
//
//  Created by arthur jamelot on 06/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import UIKit
import CoreData

class RestaurantViewController: UIViewController, UITableViewDataSource, UITableViewDelegate  {

    @IBOutlet weak var tableRestos: UITableView!
    var restos = [Lieu]()
    
    // Retreive the managedObjectContext from AppDelegate
    let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableRestos.delegate = self
        tableRestos.dataSource = self
        fetchRestos()
    }

    func fetchRestos(){
        let fetchRequest = NSFetchRequest(entityName: "Lieu")
        let predicate = NSPredicate(format: "%K == %@", "typeLieu", "Restaurant")
        fetchRequest.predicate = predicate
        do {
            let fetchResults = try self.managedObjectContext.executeFetchRequest(fetchRequest) as? [Lieu]
            guard let myFetchResult = fetchResults else {
                return
            }
            restos = myFetchResult
        } catch {
            
        }

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.restos.count)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("restosCell")! as! RestaurantTableViewCell
        cell.nomRestaurant.text = restos[indexPath.row].nomLieu
        cell.heureDebRestaurant.text = restos[indexPath.row].sHeureDeb
        cell.heureFinRestaurant.text = restos[indexPath.row].sHeureFin
        return cell
    }

    

    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "lieuSegue") {
            let backItem = UIBarButtonItem()
            backItem.title = "Retour"
            navigationItem.backBarButtonItem = backItem
            let destination = segue.destinationViewController as! LieuViewController
            let index = self.tableRestos.indexPathForSelectedRow
            destination.monLieu = self.restos[(index?.row)!]
        }
    }

}
