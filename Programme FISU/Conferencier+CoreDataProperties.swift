//
//  Conferencier+CoreDataProperties.swift
//  Programme FISU
//
//  Created by arthur jamelot on 01/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Conferencier {

    @NSManaged var metier: String?
    @NSManaged var nom: String?
    @NSManaged var activity: NSSet?

}
