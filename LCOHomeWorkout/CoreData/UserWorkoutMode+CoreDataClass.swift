//
//  UserWorkoutMode+CoreDataClass.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 11/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//
//

import Foundation
import CoreData


public class UserWorkoutMode: NSManagedObject {
    
    public override func awakeFromInsert() {
        setPrimitiveValue(Date(), forKey: "createdAt")
    }
    
    public static func create(userWorkoutMode: String, numOfSets: Int) {
        let userWorkoutModeEntity = UserWorkoutMode(context: CoreDataManager.shared.context)
        userWorkoutModeEntity.mode = userWorkoutMode
        userWorkoutModeEntity.numOfSets = Int16(numOfSets)
        CoreDataManager.shared.save()
    }
    
    static var last: UserWorkoutMode? {
        let sort = NSSortDescriptor(key: #keyPath(UserWorkoutMode.createdAt), ascending: false)
        let request = UserWorkoutMode.getFetchRequest()
        request.fetchLimit = 1
        request.sortDescriptors = [sort]
        let result = self.performFetch(fetchRequest: request)
        if result.count != 0 {
            return result.last as? UserWorkoutMode
        }
        return nil 
    }
    
    static var isWorkoutModeSelected: Bool {
        if let lastWorkoutMode = self.last,
            let selectedDate = lastWorkoutMode.createdAt, selectedDate.calenderDayDifference(from: Date()) == 0 {
            return true
        }
        return false
    }
}
