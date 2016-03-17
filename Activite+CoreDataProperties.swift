//
//  Activite+CoreDataProperties.swift
//  Programme FISU
//
//  Created by Charles on 15/03/2016.
//  Copyright © 2016 Charles. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Activite {

    @NSManaged var nomActivite: String?
    @NSManaged var date: NSDate?
    @NSManaged var choisie: NSNumber?
    @NSManaged var categorie: NSManagedObject?
    @NSManaged var conferencier: NSSet?
    @NSManaged var lieu: NSManagedObject?

}
