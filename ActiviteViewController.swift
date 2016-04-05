//
//  ActiviteViewController.swift
//  Programme FISU
//
//  Created by arthur jamelot on 04/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import UIKit

class ActiviteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    
    @IBOutlet weak var navActivite: UINavigationItem!
    @IBOutlet weak var activiteTable: UITableView!
    @IBOutlet weak var heureDebLieu: UILabel!
    @IBOutlet weak var heureFinLieu: UILabel!
    @IBOutlet weak var nomLieu: UILabel!
    @IBOutlet weak var catActivite: UILabel!
    
    var myActivite: Activite?
    var conferenciers: [Conferencier] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        conferenciers = (myActivite?.conferencier?.allObjects) as! [Conferencier]
        conferenciers.sortInPlace({$0.nom < $1.nom})
        // Do any additional setup after loading the view.
        activiteTable.delegate = self
        activiteTable.dataSource = self
        
        nomLieu.text = myActivite?.lieu?.nomLieu
        heureDebLieu.text = myActivite?.sHeureDeb
        heureFinLieu.text = myActivite?.sHeureFin
        navActivite.title = myActivite?.nomActivite
        catActivite.text = myActivite?.categorie?.nomCategorie
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: TableViewDelegate
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (self.myActivite?.conferencier!.count)!
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("conferencierCell")! as UITableViewCell
        cell.textLabel?.text = conferenciers[indexPath.row].nom
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let conferencier = conferenciers[indexPath.row]
        print(conferencier.metier)
    }
    
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == "conferencierSegue") {
            let backItem = UIBarButtonItem()
            backItem.title = "Retour"
            navigationItem.backBarButtonItem = backItem
            let destination = segue.destinationViewController as! ConferencierViewController
            let index = self.activiteTable.indexPathForSelectedRow
            destination.myConferencier = conferenciers[(index?.row)!]
        }
        if (segue.identifier == "lieuSegue") {
            let backItem = UIBarButtonItem()
            backItem.title = "Retour"
            navigationItem.backBarButtonItem = backItem
            let destination = segue.destinationViewController as! LieuViewController
            destination.monLieu = myActivite?.lieu
        }
    }

}
