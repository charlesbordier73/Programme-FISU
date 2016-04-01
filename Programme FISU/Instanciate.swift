//
//  Instanciate.swift
//  Programme FISU
//
//  Created by arthur jamelot on 01/04/2016.
//  Copyright © 2016 Charles. All rights reserved.
//

import UIKit
import CoreData

class Instanciate: NSObject {
    
    static func instance() {
        
        // Retreive the managedObjectContext from AppDelegate
        let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    
        
        
        let lieuxEntity : NSEntityDescription? = NSEntityDescription.entityForName("Lieu", inManagedObjectContext: managedObjectContext)
        
        let categorieEntity : NSEntityDescription? = NSEntityDescription.entityForName("CategorieActivite", inManagedObjectContext: managedObjectContext)
        
        let conferencierEntity : NSEntityDescription? = NSEntityDescription.entityForName("Conferencier", inManagedObjectContext: managedObjectContext)
        
        let activiteEntity : NSEntityDescription? = NSEntityDescription.entityForName("Activite", inManagedObjectContext: managedObjectContext)
        
        
        if lieuxEntity != nil && categorieEntity != nil && activiteEntity != nil && conferencierEntity != nil {
            let dateFormatter = NSDateFormatter()
            dateFormatter.dateFormat = "HH:mm"
            let lieu1: Lieu = Lieu(entity: lieuxEntity!, insertIntoManagedObjectContext: managedObjectContext)
            lieu1.adresseLieu = "50, Chemin des Vignobles, Aix les Bains"
            lieu1.heureDeb = dateFormatter.dateFromString("08:00")
            lieu1.heureFin = dateFormatter.dateFromString("17:30")
            lieu1.nomLieu = "La Bonne Fourchette"
            lieu1.typeLieu = "Restaurant"
            
            
            
            let lieu2: Lieu = Lieu(entity: lieuxEntity!, insertIntoManagedObjectContext: managedObjectContext)
            lieu2.adresseLieu = "14, Rue de l'Occitanie, Montpellier"
            lieu2.heureDeb = dateFormatter.dateFromString("12:00")
            lieu2.heureFin = dateFormatter.dateFromString("14:30")
            lieu2.nomLieu = "Amphi Dubonnet"
            lieu2.typeLieu = "Amphi"
            
            
            
            let lieu3: Lieu = Lieu(entity: lieuxEntity!, insertIntoManagedObjectContext: managedObjectContext)
            lieu3.adresseLieu = "31 Place Eugene Bataillon, Montpellier"
            lieu3.heureDeb = dateFormatter.dateFromString("06:45")
            lieu3.heureFin = dateFormatter.dateFromString("11:30")
            lieu3.nomLieu = "Gymnase du Bonsport"
            lieu3.typeLieu = "Gymnase"
            
     
            let categorie1: CategorieActivite = CategorieActivite(entity: categorieEntity!, insertIntoManagedObjectContext: managedObjectContext)
            categorie1.nomCategorie = "Activite Sportive"
            
            let categorie2: CategorieActivite = CategorieActivite(entity: categorieEntity!, insertIntoManagedObjectContext: managedObjectContext)
            categorie2.nomCategorie = "Activite Culturelle"
            
            let categorie3: CategorieActivite = CategorieActivite(entity: categorieEntity!, insertIntoManagedObjectContext: managedObjectContext)
            categorie3.nomCategorie = "Activite Académique"
            
            let categorie4: CategorieActivite = CategorieActivite(entity: categorieEntity!, insertIntoManagedObjectContext: managedObjectContext)
            categorie4.nomCategorie = "Repas"
        
        
        
        
  
            let conferencier1: Conferencier = Conferencier(entity: conferencierEntity!, insertIntoManagedObjectContext: managedObjectContext)
            conferencier1.metier = "Jedi"
            conferencier1.nom = "Anakin Skywalker"
        
            let conferencier2: Conferencier = Conferencier(entity: conferencierEntity!, insertIntoManagedObjectContext: managedObjectContext)
            conferencier2.metier = "Reporter"
            conferencier2.nom = "Tintin"
            
            let conferencier3: Conferencier = Conferencier(entity: conferencierEntity!, insertIntoManagedObjectContext: managedObjectContext)
            conferencier3.metier = "Dragon"
            conferencier3.nom = "Spyro"
            
            let conferencier4: Conferencier = Conferencier(entity: conferencierEntity!, insertIntoManagedObjectContext: managedObjectContext)
            conferencier4.metier = "Vampire"
            conferencier4.nom = "Dracula"

        
    
            let dateFormatter2 = NSDateFormatter()
            dateFormatter2.dateFormat = "dd/MM/yyyy"

            let activite1: Activite = Activite(entity: activiteEntity!, insertIntoManagedObjectContext: managedObjectContext)
            activite1.choisie = 0
            activite1.date = dateFormatter2.dateFromString("04/07/2016")
            activite1.nomActivite = "Ceremonie d'ouverture"
            
            var currentSet1: Set<Conferencier> = Set<Conferencier>()
            currentSet1.insert(conferencier1)
            currentSet1.insert(conferencier4)
            
            activite1.conferencier = currentSet1
            activite1.lieu = lieu2
            activite1.categorie = categorie3
            
            
            let activite2: Activite = Activite(entity: activiteEntity!, insertIntoManagedObjectContext: managedObjectContext)
            activite2.choisie = 0
            activite2.date = dateFormatter2.dateFromString("05/07/2016")
            activite2.nomActivite = "Vivre sa vie avec le Karaté"
            
            var currentSet2: Set<Conferencier> = Set<Conferencier>()
            currentSet2.insert(conferencier2)
            
            activite2.conferencier = currentSet2
            activite2.lieu = lieu3
            activite1.categorie = categorie2
            
        }
        
        
        NSUserDefaults.standardUserDefaults().setObject(false, forKey: "firstStart")
        do {
            try managedObjectContext.save()
        } catch {
            print(error)
        }
    }
}






