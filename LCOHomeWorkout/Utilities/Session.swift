//
//  Session.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 11/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//

import Foundation

class Session {
    private init() { }
    static var shared = Session()
    
    var isExercisesAdded: Bool {
        return false
    }
}
