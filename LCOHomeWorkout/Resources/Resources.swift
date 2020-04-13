//
//  Resources.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 07/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//

import Foundation
import UIKit

struct LCOColors {
    static let defaultColor = getColor(red: 189, green: 33, blue: 217)
    static let defaultColorLight = getColor(red: 189, green: 33, blue: 217, alpha: 0.5)
    private static func getColor(red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat = 1) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

struct LCOString {
    static var empty = ""
}
