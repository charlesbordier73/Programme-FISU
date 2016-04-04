//
//  Activite.swift
//  Programme FISU
//
//  Created by arthur jamelot on 01/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import Foundation
import CoreData


class Activite: NSManagedObject {
    
    static var dateFormat: NSDateFormatter = {
        let formatDate = NSDateFormatter()
        formatDate.dateFormat = "dd/MM/yyyy"
        return formatDate
    }()
    
    var sDate: String?{
        get{
            guard let maDate = self.date else{
                return nil
            }
            return Activite.dateFormat.stringFromDate(maDate)
        }
    }
  
}
