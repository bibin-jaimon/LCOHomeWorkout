//
//  WorkoutListViewController.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 07/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//

import UIKit

class WorkoutListViewController: UIViewController {
    
    var userWorkoutMode: WorkoutModeType! {
        if let lastWorkoutMode = UserWorkoutMode.last {
            return WorkoutModeType.init(rawValue: lastWorkoutMode.mode!)
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(Utilities.applicationDirectoryURL()!.absoluteString)
        NavigationManager.shared.navigationControl = self.navigationController
        
        if !UserWorkoutMode.isWorkoutModeSelected {
            NavigationManager.shared.navigateToWorkoutModeSelectionVC(vc: self)
        }
        print("STATIC METHODE \n\((Exercises.fetchRecordById(with: 5) as! Exercises))")
        print("\n\nCOREDATA MANAGER\n\(CoreDataManager.shared.fetchRecord(forEntity: Exercises.self, withId: 22))")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        setTitle()
    }
    
    func setTitle() {
        if UserWorkoutMode.isWorkoutModeSelected {
            title = userWorkoutMode.rawValue
        }
    }
}
extension UIView {
    func activateConstraints(with constraints: [NSLayoutConstraint]) {
        constraints.forEach { (constraint) in
            constraint.isActive = true
        }
    }
}
