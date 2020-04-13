//
//  Exercises+CoreDataProperties.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 11/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//
//

import Foundation
import CoreData


extension Exercises {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Exercises> {
        return NSFetchRequest<Exercises>(entityName: "Exercises")
    }

    @NSManaged public var duration: Int16
    @NSManaged public var id: Int16
    @NSManaged public var imageURL: String?
    @NSManaged public var name: String?
    @NSManaged public var createdAt: Date?
    @NSManaged public var drills: NSSet?

}

// MARK: Generated accessors for drills
extension Exercises {

    @objc(addDrillsObject:)
    @NSManaged public func addToDrills(_ value: Drills)

    @objc(removeDrillsObject:)
    @NSManaged public func removeFromDrills(_ value: Drills)

    @objc(addDrills:)
    @NSManaged public func addToDrills(_ values: NSSet)

    @objc(removeDrills:)
    @NSManaged public func removeFromDrills(_ values: NSSet)

}
