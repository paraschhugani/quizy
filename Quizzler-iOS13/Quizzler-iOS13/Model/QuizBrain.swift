//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Paras Chhugani on 06/05/20.
//  Copyright © 2020 ParasChhugani.co . All rights reserved.
//

import Foundation

struct QuizBrain {
    
    var questionNo = 0
    var score = 0
    
    let ques = [
        Question(q: "Which is the largest organ in the human body?", a: ["Heart", "Skin", "Large Intestine"], correctAnswer: "Skin"),
        Question(q: "Five dollars is worth how many nickels?", a: ["25", "50", "100"], correctAnswer: "100"),
        Question(q: "What do the letters in the GMT time zone stand for?", a: ["Global Meridian Time", "Greenwich Mean Time", "General Median Time"], correctAnswer: "Greenwich Mean Time"),
        Question(q: "What is the French word for 'hat'?", a: ["Chapeau", "Écharpe", "Bonnet"], correctAnswer: "Chapeau"),
        Question(q: "In past times, what would a gentleman keep in his fob pocket?", a: ["Notebook", "Handkerchief", "Watch"], correctAnswer: "Watch"),
        Question(q: "How would one say goodbye in Spanish?", a: ["Au Revoir", "Adiós", "Salir"], correctAnswer: "Adiós"),
        Question(q: "Which of these colours is NOT featured in the logo for Google?", a: ["Green", "Orange", "Blue"], correctAnswer: "Orange"),
        Question(q: "What alcoholic drink is made from molasses?", a: ["Rum", "Whisky", "Gin"], correctAnswer: "Rum"),
        Question(q: "What type of animal was Harambe?", a: ["Panda", "Gorilla", "Crocodile"], correctAnswer: "Gorilla"),
        Question(q: "Where is Tasmania located?", a: ["Indonesia", "Australia", "Scotland"], correctAnswer: "Australia")
    ]
    
    mutating func checkAnswer(_ userAnswer :String) -> Bool {
        if userAnswer == ques[questionNo].rightAnswer {
            score += 1
            return true
            
        }
        else{
            return false
        }
    }
    
    
    func getQuestionText() -> String {
        return ques[questionNo].text
    }
    
    
    func getProgress() -> Float {
       return (Float(questionNo+1)/Float(ques.count))
    }
    mutating func nextquestion(){
        questionNo += 1
        if questionNo == ques.count{
            questionNo = 0
            score = 0
        }
    }
    func getAnswers() -> [String] {
        return ques[questionNo].answers
    }
    
    
    
    func getScore() -> Int{
        return score
    }
    
}

