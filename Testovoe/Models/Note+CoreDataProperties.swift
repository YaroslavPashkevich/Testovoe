//
//  Note+CoreDataProperties.swift
//  
//
//  Created by  Yaroslav on 27.10.21.
//
//

import Foundation
import CoreData


extension Note {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Note> {
        return NSFetchRequest<Note>(entityName: "Note")
    }

    @NSManaged public var jokes: String?

}
