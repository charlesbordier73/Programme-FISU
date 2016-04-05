//
//  Activite+CoreDataProperties.swift
//  Programme FISU
//
//  Created by arthur jamelot on 05/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Activite {

    @NSManaged var choisie: NSNumber?
    @NSManaged var nomActivite: String?
    @NSManaged var dateDeb: NSDate?
    @NSManaged var dateFin: NSDate?
    @NSManaged var categorie: CategorieActivite?
    @NSManaged var conferencier: NSSet?
    @NSManaged var lieu: Lieu?

}
