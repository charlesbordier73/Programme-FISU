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
        return cell
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
