//
//  MockData.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 10/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//

import Foundation

enum ChartCode: Int {
    case charle = 1
}

public let workoutData: [String: Any] = [
    "exercises":[
        [   "id":1,
            "name": "Lat back",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60,
            "setOrder": 1
        ],
        [   "id":2,
            "name": "Machine front",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":3,
            "name": "D B DeadLift",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":4,
            "name": "Chinning",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":5,
            "name": "Barbel Curl close grip",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":6,
            "name": "D B peacher curl",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":7,
            "name": "Standing machine curl",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":8,
            "name": "Wrist curl",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":9,
            "name": "Cycle",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":10,
            "name": "Hack squat",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":11,
            "name": "Abductor",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":12,
            "name": "Lunges (bar)",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":13,
            "name": "Calf",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":14,
            "name": "Back press",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":15,
            "name": "D B hammer front raise",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":16,
            "name": "Reverse peck deck",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":17,
            "name": "side raise",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":18,
            "name": "suray namaskar",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":19,
            "name": "Incline bench press",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":20,
            "name": "decline flyes",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":21,
            "name": "pecdeck",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":22,
            "name": "pull over",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":23,
            "name": "D B hammer front raise",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":24,
            "name": "barbell trice",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":25,
            "name": "pully trice",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":26,
            "name": "D B hammer curl",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ],
        [   "id":27,
            "name": "reverse wrist curl",
            "imageURL": nil,
            "setNumber": 1,
            "duration": 60
        ]
    ],
    
    "drills": [
        [
            "id": 1,
            "exerciseIds": [1,2,3,4,5]
        ],
        [
            "id": 2,
            "exerciseIds": [6,7,8,9,10]
        ],
        [
            "id": 3,
            "exerciseIds": [11,12,13,14,15]
        ],
        [
            "id": 4,
            "exerciseIds": [16,17,18,19,20]
        ]
    ],
    
    "workouts": [
        [   "id": 1,
            "name": "charle",
            "chartCode": 1,
            "numberOfDrills": 4,
            "drills": [1,2,3,4],
            "workoutPeriods": 40
        ]
    ]
    
]
