//
//  MainViewController.swift
//  MathTrainer
//
//  Created by Dmitrii Nazarov on 19.11.2023.
//

import UIKit

enum MathTypes: Int {
    case add, substract, multiply, divide
}

class MainViewController: UIViewController {
    // MARK: - IBOutlets
    @IBOutlet private var buttonsCollection: [UIButton]!
    @IBOutlet private var addLabel: UILabel!
    @IBOutlet private var subLabel: UILabel!
    @IBOutlet private var divLabel: UILabel!
    @IBOutlet private var multLabel: UILabel!
    
    // MARK: - Properties
    private var selectedType: MathTypes = .add
    var plusCounter: Int = 0
    var minusCounter: Int = 0
    var divCounter: Int = 0
    var multCounter: Int = 0
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
        //updateCountLabel()
    }
    
    // MARK: - Actions
    @IBAction private func buttonsAction(_ sender: UIButton) {
        selectedType = MathTypes(rawValue: sender.tag) ?? .add
        performSegue(withIdentifier: "goToNext", sender: sender)
    }
    
    @IBAction private func unwindAction(segue: UIStoryboardSegue){
        guard let trainVC = segue.source as? TrainViewController else { return }
        updateCountLabel(with: trainVC.count)
    }
    
    // MARK: - Methods
    private func configureButtons(){
        buttonsCollection.forEach { button in
            button.layer.borderColor = UIColor.darkGray.cgColor
            button.layer.shadowOffset = CGSize(width: 1, height: 3)
            button.layer.shadowOpacity = 0.45
            button.layer.shadowRadius = 3
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let viewController = segue.destination as? TrainViewController{
            viewController.type = selectedType
        }
    }
    
    private func updateCountLabel(with count: Int = 0) {
        switch selectedType {
        case .add:
            addLabel.text = String(count)
        case .substract:
            subLabel.text = String(count)
        case .multiply:
            multLabel.text = String(count)
        case .divide:
            divLabel.text = String(count)
        }
    }
}
