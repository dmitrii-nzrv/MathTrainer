//
//  TrainViewController.swift
//  MathTrainer
//
//  Created by Dmitrii Nazarov on 20.11.2023.
//


import UIKit

final class TrainViewController: UIViewController{
    
    // MARK: - Properties
    private var firstNumber = 0
    private var secondNumber = 0
    private var sign: String = ""
    private var count: Int = 0{
        didSet{
            print("Coint: \(count)")
        }
    }
    
    var type: MathTypes = .add{
        didSet {
            switch type {
            case .add:
                sign = "+"
            case .substract:
                sign = "-"
            case .multiply:
                sign = "*"
            case .divide:
                sign = "/"
            }
            
        }
    }

    private var answer: Int{
        switch type {
        case .add:
            return firstNumber + secondNumber
        case .substract:
            return firstNumber - secondNumber
        case .multiply:
            
          
            return firstNumber * secondNumber
        case .divide:
            if firstNumber % secondNumber != 0{
                firstNumber += 1
                configureQuestions()
                configureButtons()
            }
            
            return firstNumber / secondNumber
        }
    }
    
    
    
    // MARK: - Outlets
    
    @IBOutlet var leftButton: UIButton!
    
    @IBOutlet var rightButton: UIButton!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var backButton: UIButton!
    
    // MARK: - Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureQuestions()
        configureButtons()
        
    }
    
    //MARK: - IBActions
    
    @IBAction func leftAction(_ sender: UIButton) {
        check(answer: sender.titleLabel?.text ?? "", for: sender)
    }
    
    @IBAction func rightAction(_ sender: UIButton) {
        check(answer: sender.titleLabel?.text ?? "", for: sender)
    }
    
    
    //MARK: - Methods
    private func configureButtons(){
        let buttonsArray = [leftButton,rightButton]
        
        buttonsArray.forEach { button in
            button?.backgroundColor = .systemYellow
        }
        
        
        // custom back button
        backButton.layer.cornerRadius = 30
        backButton.tintColor = UIColor.secondaryLabel
        
        
        // add shadows
        buttonsArray.forEach { button in
            button?.layer.borderColor = UIColor.darkGray.cgColor
            button?.layer.shadowOffset = CGSize(width: 1, height: 3)
            button?.layer.shadowOpacity = 0.45
            button?.layer.shadowRadius = 3
        }
        
        let isRightButton = Bool.random()
        
        
        
        
        var  randomAnswer: Int
        
        repeat {
            randomAnswer = Int.random(in: (answer - 13)...(answer+13))
            
        } while randomAnswer == answer
        
        
        
        
        rightButton.setTitle(isRightButton ? String(answer) : String(randomAnswer), for: .normal)
        leftButton.setTitle(isRightButton ? String(randomAnswer) : String(answer), for: .normal)
        
        
    }
    
    private func configureQuestions(){
        
        if type == .multiply{
            firstNumber = Int.random(in: 1...99)
            secondNumber = Int.random(in: 1...99)
        }else{
            firstNumber = Int.random(in: 1...999)
            secondNumber = Int.random(in: 1...999)
        }
        
        let question: String = "\(firstNumber) \(sign) \(secondNumber) ="
        questionLabel.text = question
    }
    
    private func check(answer: String, for button: UIButton){
        let isRightAnswer = Int(answer) == self.answer
        
        button.backgroundColor = isRightAnswer ? .green : .red
        
        if isRightAnswer {
            let isSecondAttempt: Bool = rightButton.backgroundColor == .red || leftButton.backgroundColor == .red ? true : false
            
            count += isSecondAttempt ? 0 : 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) { [ weak self] in
                self?.configureQuestions()
                self?.configureButtons()
                
            }
            
        }
        
    }
    
    
}
