//
//  Drills+CoreDataProperties.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 11/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//
//

import Foundation
import CoreData


extension Drills {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Drills> {
        return NSFetchRequest<Drills>(entityName: "Drills")
    }

    @NSManaged public var createdAt: Date?
    @NSManaged public var id: Int16
    @NSManaged public var exercises: NSSet?
    @NSManaged public var workout: Workouts?

}

// MARK: Generated accessors for exercises
extension Drills {

    @objc(addExercisesObject:)
    @NSManaged public func addToExercises(_ value: Exercises)

    @objc(removeExercisesObject:)
    @NSManaged public func removeFromExercises(_ value: Exercises)

    @objc(addExercises:)
    @NSManaged public func addToExercises(_ values: NSSet)

    @objc(removeExercises:)
    @NSManaged public func removeFromExercises(_ values: NSSet)

}
