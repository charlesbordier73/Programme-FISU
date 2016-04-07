//
//  ConferencierViewController.swift
//  Programme FISU
//
//  Created by arthur jamelot on 05/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import UIKit

class ConferencierViewController: UIViewController {

    @IBOutlet weak var navConferencier: UINavigationItem!
    @IBOutlet weak var myMetier: UILabel!
    var myConferencier: Conferencier?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        navConferencier.title = myConferencier?.nom
        myMetier.text = myConferencier?.metier
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}
