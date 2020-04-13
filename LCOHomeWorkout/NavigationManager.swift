//
//  NavigationManager.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 07/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//

import Foundation
import UIKit

class NavigationManager {
    static let shared = NavigationManager()
    private init() { }
    
    var navigationControl: UINavigationController?
    
    func navigateToWorkoutModeSelectionVC(vc: UIViewController) {
        let viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(identifier: "WorkoutModeSelectionViewController") as! WorkoutModeSelectionViewController
//        self.navigatonControl?.pushViewController(viewController, animated: true)
        viewController.modalPresentationStyle = .automatic
        viewController.isModalInPresentation = true
        vc.present(viewController, animated: true) {
        }
    }
}
