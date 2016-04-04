//
//  Lieu.swift
//  Programme FISU
//
//  Created by arthur jamelot on 01/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import Foundation
import CoreData


class Lieu: NSManagedObject {
    
    static var dateFormat: NSDateFormatter = {
        let formatDate = NSDateFormatter()
        formatDate.dateFormat = "HH:mm"
        return formatDate
    }()
    
    var sHeureDeb: String?{
        get{
            guard let monHeureDeb = self.heureDeb else{
                return nil
            }
            return Lieu.dateFormat.stringFromDate(monHeureDeb)
        }
    }
    
    var sHeureFin: String?{
        get{
            guard let monHeureFin = self.heureFin else{
                return nil
            }
            return Lieu.dateFormat.stringFromDate(monHeureFin)
        }
    }
}
