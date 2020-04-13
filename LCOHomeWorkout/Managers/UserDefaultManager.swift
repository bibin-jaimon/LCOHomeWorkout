//
//  UserDefaultManager.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 09/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//

import Foundation

struct UserDefaultManager {
    @UserDefault("Keys.threeSixtyDegreeUrl", defaultValue: LCOString.empty)
    static var threeSixtyDegreeUrl: String
    
    @UserDefault("isAddedExercises", defaultValue: false)
    static var isAddedExercises
}

@propertyWrapper
struct UserDefault<T> {
    let key: String
    let defaultValue: T

    init(_ key: String, defaultValue: T) {
        self.key = key
        self.defaultValue = defaultValue
    }

    var wrappedValue: T {
        get {
            return UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
        }
        set {
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
}

