//
//  UserWorkoutMode+CoreDataProperties.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 11/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//
//

import Foundation
import CoreData


extension UserWorkoutMode {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserWorkoutMode> {
        return NSFetchRequest<UserWorkoutMode>(entityName: "UserWorkoutMode")
    }

    @NSManaged public var mode: String?
    @NSManaged public var numOfSets: Int16
    @NSManaged public var createdAt: Date?

}
