//
//  Conferencier.swift
//  Programme FISU
//
//  Created by Charles on 15/03/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import Foundation
import CoreData


class Conferencier: NSManagedObject {

// Insert code here to add functionality to your managed object subclass
    class func createInManagedObjectContext(moc: NSManagedObjectContext, nom: String, metier: String) -> Conferencier {
        let newItem = NSEntityDescription.insertNewObjectForEntityForName("Conferencier", inManagedObjectContext: moc) as! Conferencier
        newItem.nom = nom
        newItem.metier = metier
        
        return newItem
    }

}
