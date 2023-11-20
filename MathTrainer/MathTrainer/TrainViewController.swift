//
//  TrainViewController.swift
//  MathTrainer
//
//  Created by Dmitrii Nazarov on 20.11.2023.
//


import UIKit

final class TrainViewController: UIViewController{
    
    // MARK: - Properties
    
    var type: MathTypes = .add{
        didSet {
            print(type)
        }
    }
    
    // MARK: - Outlets
    @IBOutlet var trainButtonsCollection: [UIButton]!
    
    @IBOutlet var backButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    }
    
    
    
    
    //MARK: - Methods
    private func configureButtons(){
        // custom back button
        backButton.layer.cornerRadius = 30
        backButton.tintColor = UIColor.secondaryLabel
        
        
        // add shadows
        trainButtonsCollection.forEach { button in
            button.layer.borderColor = UIColor.darkGray.cgColor
            button.layer.shadowOffset = CGSize(width: 1, height: 3)
            button.layer.shadowOpacity = 0.45
            button.layer.shadowRadius = 3
        }
    }
}
