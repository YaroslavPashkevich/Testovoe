//
//  Note+CoreDataClass.swift
//  
//
//  Created by  Yaroslav on 27.10.21.
//
//

import Foundation
import CoreData

@objc(Note)
public class Note: NSManagedObject, Identifiable {

    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var jokes: String
    
}
