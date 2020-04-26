//
//  ViewController.swift
//  Quizzler
//
//  Created by Made Dhanar Indhira Yoga on 26/04/20.
//  Copyright © 2020 ADA. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rightButton: UIButton!
    @IBOutlet weak var resetOutlet: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var answerText: UILabel!
    @IBOutlet weak var scoreResult: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var nextOutlet: UIButton!
    @IBOutlet weak var progressBar: UIProgressView!
    

    var quizCore = QuizCore()

    
    @IBAction func resetBtn(_ sender: Any) {
        reset()
    }
    
    
    @IBAction func next(_ sender: UIButton) {
        quizCore.countQuestion()
        print("Question Number:\(quizCore.questionNumber)")
        print(quizCore.question.count)
        if quizCore.questionNumber >= quizCore.question.count{
            resetOutlet.isHidden = false
            scoreResult.isHidden = false
            answerText.isHidden = true
            questionLabel.isHidden = true
            rightButton.isHidden = true
            falseButton.isHidden = true
            nextOutlet.isHidden = true
            scoreResult.text = "Your Score: \(scoreLabel.text!)"
        }else{
            rightButton.isHidden = false
            falseButton.isHidden = false
            nextOutlet.isHidden = true
            answerText.isHidden = true
            questionLabel.isHidden = false
            updateUI()
            
        }
    }
    
    @IBAction func answerBtn(_ sender: UIButton) {

        let answer = sender.currentTitle
        let questionTrue = quizCore.answerValid(answer!)
        
        if  questionTrue{
            answerText.isHidden = false
            questionLabel.isHidden = true
            rightButton.isHidden = true
            falseButton.isHidden = true
            nextOutlet.isHidden = false
            answerText.text = "Your answer is correct!"

        } else{
            answerText.isHidden = false
            questionLabel.isHidden = true
            rightButton.isHidden = true
            falseButton.isHidden = true
            nextOutlet.isHidden = false
            answerText.text = "Your answer is wrong!"
        }

    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerText.isHidden = true
        scoreResult.isHidden = true
        nextOutlet.isHidden = true
        resetOutlet.isHidden = true
        updateUI()
    }
    
    func updateUI(){
            countLabel.text = "Question No: \(quizCore.questionNumber + 1)/\(quizCore.question.count)"
            questionLabel.text = quizCore.getQuestionText()
            scoreLabel.text = String("Score: \(quizCore.getScore())")
            rightButton.backgroundColor = UIColor.clear
            falseButton.backgroundColor = UIColor.clear
            progressBar.progress = quizCore.getProgress()
        
    }
    
    func reset(){
        quizCore.questionNumber = 0
        quizCore.score = 0
        quizCore.progress = 0.0
        scoreResult.text = ""
        questionLabel.text = quizCore.getQuestionText()
        scoreLabel.text = String("Score: \(quizCore.getScore())")
        rightButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        progressBar.progress = quizCore.getProgress()
        answerText.isHidden = true
        scoreResult.isHidden = true
        questionLabel.isHidden = false
        rightButton.isHidden = false
        falseButton.isHidden = false
        nextOutlet.isHidden = true
        resetOutlet.isHidden = true
    }

}

