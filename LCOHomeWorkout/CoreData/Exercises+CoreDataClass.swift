//
//  Exercises+CoreDataClass.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 11/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//
//

import Foundation
import CoreData


public class Exercises: NSManagedObject {
    public override func awakeFromInsert() {
        setPrimitiveValue(Date(), forKey: "createdAt")
    }
    public static func createOrUpdate(data: [[String: Any]]) {
        data.forEach { (exercise) in
            if let exerciseId = exercise["id"] as? Int {
                let exerciseEntity: Exercises! = CoreDataManager.shared.fetchRecord(forEntity: self, withId: exerciseId)
                exerciseEntity.id = Int16(exerciseId)
                exerciseEntity.name = exercise["name"] as? String
                exerciseEntity.imageURL = exercise["imageURL"] as? String
                if let duration = exercise["duration"] as? Int {
                    exerciseEntity.duration = Int16(duration)
                }
            }
            
        }
        CoreDataManager.shared.save()
        print(Exercises.count)
    }
}
