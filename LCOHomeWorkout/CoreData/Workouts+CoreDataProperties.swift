//
//  Workouts+CoreDataProperties.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 11/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//
//

import Foundation
import CoreData


extension Workouts {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Workouts> {
        return NSFetchRequest<Workouts>(entityName: "Workouts")
    }

    @NSManaged public var id: Int16
    @NSManaged public var name: String?
    @NSManaged public var workoutPeriods: Int16
    @NSManaged public var creaedAt: Date?
    @NSManaged public var drills: NSSet?

}

// MARK: Generated accessors for drills
extension Workouts {

    @objc(addDrillsObject:)
    @NSManaged public func addToDrills(_ value: Drills)

    @objc(removeDrillsObject:)
    @NSManaged public func removeFromDrills(_ value: Drills)

    @objc(addDrills:)
    @NSManaged public func addToDrills(_ values: NSSet)

    @objc(removeDrills:)
    @NSManaged public func removeFromDrills(_ values: NSSet)

}
