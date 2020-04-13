//
//  Utilities.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 09/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//

import Foundation

class Utilities {
    static func applicationDirectoryURL() -> URL? {
        guard let url = FileManager.default.urls(for: .libraryDirectory, in: .userDomainMask).first else {
            return nil
        }
        return url
    }
}
