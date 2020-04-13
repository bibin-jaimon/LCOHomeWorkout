//
//  WorkoutModeCollectionViewCell.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 07/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//

import UIKit

class WorkoutModeCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var workoutModeLabel: UILabel!
    
    override func awakeFromNib() {
        self.backgroundImageView.addTransparentBlackLayer(with: 0.7)
        self.backgroundImageView.layer.cornerRadius = 10
        self.backgroundImageView.clipsToBounds = true
        
        workoutModeLabel.textColor = .white
    }
    func setupCell(modeType: WorkoutModeType) {
        workoutModeLabel.text = modeType.rawValue
    }
}
