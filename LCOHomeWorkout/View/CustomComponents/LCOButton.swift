//
//  LCOButton.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 08/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//

import UIKit

class LCOButton: UIButton {

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        self.backgroundColor = LCOColors.defaultColor
        self.setTitle("LET'S START", for: .normal)
        self.setTitleColor(.white, for: .normal)
        self.layer.cornerRadius = self.bounds.size.height / 2
    }
    
}
