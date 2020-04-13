//
//  WorkoutModeSelectionViewController.swift
//  LCOHomeWorkout
//
//  Created by Bibin Jaimon on 07/04/20.
//  Copyright © 2020 Bibin Jaimon. All rights reserved.
//

import UIKit

enum WorkoutModeType: String {
    case random = "Random Mode"
    case daywise = "Daywise Mode"
}

class WorkoutModeSelectionViewController: UIViewController {

    @IBOutlet weak var startButton: LCOButton!
    
    @IBOutlet weak var noOfSetTextField: UITextField!
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var workoutModeCollectionView: UICollectionView!
    
    @IBOutlet weak var startButtonBottumConstraint: NSLayoutConstraint!
    
    var numberofSets: Int? {
        if let sets = self.noOfSetTextField.text {
            return Int(sets)
        }
        return nil
    }
    
    var workoutModeData: [WorkoutModeType] = [
        WorkoutModeType.random,
        WorkoutModeType.daywise
    ]
    
    fileprivate func setupPageController() {
        pageController.numberOfPages = 2
        pageController.currentPageIndicatorTintColor = LCOColors.defaultColor
        pageController.pageIndicatorTintColor = .gray
        pageController.currentPage = 0
        pageController.isUserInteractionEnabled = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionViewCell()
        setupPageController()
        addKeybordChangeObserver()
        noOfSetTextField.delegate = self
        noOfSetTextField.keyboardType = .numberPad

    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.noOfSetTextField.resignFirstResponder()
        performUIAnimation(checker: true, height: 0, duration: 0.3)
    }
    
    private func addKeybordChangeObserver() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleKeyboardHeightChange),
                                               name: UIResponder.keyboardWillChangeFrameNotification,
                                               object: nil)
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(handleKeyboardHeightChange),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
    }
    
    @objc func handleKeyboardHeightChange(_ notification: Notification) {
        if let userInfo = notification.userInfo, let rect = userInfo["UIKeyboardFrameEndUserInfoKey"] as? CGRect {
            let height = rect.height
            let checker: Bool = height == 0
            performUIAnimation(checker: checker, height: height)
        }
    }
    private func performUIAnimation(checker: Bool, height: CGFloat, duration: TimeInterval = 0.5) {
        let constraintHeight: CGFloat = checker ? 20 : height + 40
        let alpha: CGFloat = checker ? 1.0 : 0
        let textFieldBorderColor: UIColor = checker ? LCOColors.defaultColorLight : .white
        
        self.startButtonBottumConstraint.constant = constraintHeight
        UIView.animate(withDuration: duration) {
            self.workoutModeCollectionView.alpha = alpha
            self.pageController.alpha = alpha
            self.startButton.alpha = alpha
            self.noOfSetTextField.layer.borderColor = textFieldBorderColor.cgColor
            self.noOfSetTextField.layer.borderWidth = 1
            self.view.layoutIfNeeded()
        }
    }
    @IBAction func didTappedStartButton(_ sender: Any) {
        if let numberofSets = self.numberofSets {
            let currentSelectedMode = self.workoutModeData[self.pageController.currentPage]
            UserWorkoutMode.create(userWorkoutMode: currentSelectedMode.rawValue, numOfSets: numberofSets)
            if let vc = NavigationManager.shared.navigationControl?.viewControllers.first as? WorkoutListViewController {
                vc.title = currentSelectedMode.rawValue
            }
            self.dismiss(animated: true, completion: nil)
        } else {
            //show to fill the sets
        }
    }
    
    private func setupCollectionViewCell() {
        self.workoutModeCollectionView.dataSource = self
        self.workoutModeCollectionView.delegate = self
    }

}

extension WorkoutModeSelectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workoutModeData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WorkoutModeCollectionViewCell", for: indexPath) as! WorkoutModeCollectionViewCell
        cell.setupCell(modeType: workoutModeData[indexPath.row])
        return cell
    }
}

extension WorkoutModeSelectionViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 10
        let height = collectionView.bounds.height - 20
        return CGSize(width: width, height: height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 10
    }
}

extension WorkoutModeSelectionViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.pageController.currentPage = indexPath.row
    }
}

extension WorkoutModeSelectionViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        performUIAnimation(checker: true, height: 0, duration: 0)
        return true
    }
}
