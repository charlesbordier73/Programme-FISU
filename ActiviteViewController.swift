//
//  ActiviteViewController.swift
//  Programme FISU
//
//  Created by arthur jamelot on 04/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import UIKit

class ActiviteViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UINavigationBarDelegate {

    @IBOutlet weak var navActivite: UINavigationBar!
    @IBOutlet weak var activiteTable: UITableView!
    @IBOutlet weak var heureDebLieu: UILabel!
    @IBOutlet weak var heureFinLieu: UILabel!
    @IBOutlet weak var nomLieu: UILabel!
    
    var myActivite: Activite?
    var conferenciers: [Conferencier] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(myActivite?.nomActivite)
        conferenciers = (myActivite?.conferencier?.allObjects) as! [Conferencier]
        // Do any additional setup after loading the view.
        activiteTable.delegate = self
        activiteTable.dataSource = self
        
        nomLieu.text = myActivite?.lieu?.nomLieu
        heureDebLieu.text = myActivite?.lieu?.sHeureDeb
        heureFinLieu.text = myActivite?.lieu?.sHeureFin
        navActivite.delegate = self
        navActivite.topItem?.title = self.myActivite?.nomActivite
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
//        self.performSegueWithIdentifier("conferencierSegue", sender: conferencier)
        print(conferencier.metier)
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
