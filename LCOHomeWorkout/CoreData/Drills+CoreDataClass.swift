//
//  Drills+CoreDataClass.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 11/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//
//

import Foundation
import CoreData


public class Drills: NSManagedObject {
    public override func awakeFromInsert() {
        setPrimitiveValue(Date(), forKey: "createdAt")
    }
    public static func createOrUpdate(data: [[String: Any]]) {
        data.forEach { (drill) in
            if let drillId = drill["id"] as? Int {
                let drillRecord: Drills = Drills.fetchOrCreate(for: drillId)
                drillRecord.id = Int16(drillId)
                if let exerciseIds = drill["exerciseIds"] as? [Int] {
                    var exercisesSet = Set<Exercises>()
                    exerciseIds.forEach { (exerciseId) in
                        if let fetchedExercise: Exercises = Exercises.fetchRecordById(with: exerciseId) {
                            fetchedExercise.addToDrills(drillRecord)
                            exercisesSet.insert(fetchedExercise)
                        } else {
                            print("Exercise with \(exerciseId) is not found in Exercises DB")
                        }
                    }
                    drillRecord.addToExercises((exercisesSet as NSSet))
                }
            }
        }
        CoreDataManager.shared.save()
    }
}
