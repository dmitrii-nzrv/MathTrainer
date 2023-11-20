//
//  ViewController.swift
//  MathTrainer
//
//  Created by Dmitrii Nazarov on 19.11.2023.
//

import UIKit

enum MathTypes: Int{
    case add, substract, multiply, divide
}


class ViewController: UIViewController {
    
    // MARK: - Properties
    private var selectedType: MathTypes = .add
    
    
    
    // MARK: - IBOutlets
    @IBOutlet var buttonsCollection: [UIButton]!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureButtons()
    }

    // MARK: - Actions
    @IBAction func buttonsAction(_ sender: UIButton) {
        selectedType = MathTypes(rawValue: sender.tag) ?? .add
        performSegue(withIdentifier: "goToNext", sender: sender)
        //для того, чтобы знать на какой сегвей переключаться при нажатии
        
       
        
    }
    
    @IBAction func unwindAction(segue: UIStoryboardSegue){
    }
    // для того, чтоб работал unwind segue(обратка)
    
    // MARK: - Methods
    private func configureButtons(){
        // add shadows
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
    // для передачи данных на другие контроллеры
}

