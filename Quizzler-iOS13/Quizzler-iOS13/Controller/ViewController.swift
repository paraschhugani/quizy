//
//  ViewController.swift
//  Quizzler
//
//  Created by Paras Chhugani on 12/07/2019.
//  Copyright © 2020 ParasChhugani.co . All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var score: UILabel!
    @IBOutlet var questionLabel: UILabel!
    
    @IBOutlet var answer1: UIButton!
    @IBOutlet var answer2: UIButton!
    @IBOutlet var answer3: UIButton!
    
    @IBOutlet var progressBar: UIProgressView!
    
    var quizbrain = QuizBrain()
    
    
    
        override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        progressBar.progress = 0.0
        
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizbrain.checkAnswer(userAnswer)
        if (userGotItRight){
            print("right")
            sender.backgroundColor = UIColor.green
        }
        else{
            print("wrong")
            sender.backgroundColor = UIColor.red
            }
        
        
        progressBar.progress = quizbrain.getProgress()
        quizbrain.nextquestion()
        
        Timer.scheduledTimer(timeInterval:0.2 , target:self, selector: #selector(updateUI), userInfo: nil, repeats: false)
        
        
    }
    
     @objc func updateUI(){
         questionLabel.text = quizbrain.getQuestionText()
        let answers = quizbrain.getAnswers()
        answer1.setTitle(answers[0], for: .normal)
        answer2.setTitle(answers[1], for: .normal)
        answer3.setTitle(answers[2], for: .normal)
        
        //making the background colors go clear for next question
        answer1.backgroundColor = UIColor.clear
        answer2.backgroundColor = UIColor.clear
        answer3.backgroundColor = UIColor.clear
        
        score.text = "score : \(quizbrain.getScore())"
         
         
         
     }
}

