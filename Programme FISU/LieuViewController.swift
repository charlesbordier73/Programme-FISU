//
//  LieuViewController.swift
//  Programme FISU
//
//  Created by arthur jamelot on 05/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import UIKit

class LieuViewController: UIViewController {

    @IBOutlet weak var navLieu: UINavigationItem!
    @IBOutlet weak var heureDebLieu: UILabel!
    @IBOutlet weak var heureFinLieu: UILabel!
    @IBOutlet weak var adresseLieu: UILabel!
    
    var monLieu: Lieu?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navLieu.title = monLieu?.nomLieu
        heureDebLieu.text = monLieu?.sHeureDeb
        heureFinLieu.text = monLieu?.sHeureFin
        adresseLieu.text = monLieu?.adresseLieu
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
