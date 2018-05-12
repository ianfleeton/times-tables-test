//
//  TimesTablesViewController.swift
//  TimesTablesTest
//
//  Created by Ian Fleeton on 16/12/2017.
//  Copyright © 2017 Ian Fleeton. All rights reserved.
//

import UIKit

class TimesTablesViewController: UIViewController, UITextFieldDelegate {
    var number = 0
    @IBOutlet var question: UILabel!
    @IBOutlet var guess: UITextField!
    @IBOutlet var checkContinueButton: UIButton!
    var questions: [Int] = []
    var current = 0
    var correct = 0
    var explaining = false
    
    let wellDones = [
        "correct! you're awesome",
        "spot on!",
        "well done smarty pants!",
        "perfect!",
        "yes!",
        "good!",
        "nice one!",
        "yep",
        "cool beans!",
        "that's right!"
    ]
    
    let ohNoes = [
        "oh no!",
        "oops!",
        "eek!",
        "nope,",
        "no,",
        "not right,",
        "wrong,",
        "try harder!"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        questions = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].shuffled()
        
        setQuestion()
    }

    func setQuestion() {
        question.text = "\(questions[current]) x \(number) ="
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func checkAnswer() {
        if (explaining) {
            explaining = false

            checkContinueButton.setTitle("check", for: .normal)
            guess.text = ""
            if (current < 11) {
                current += 1
                setQuestion()
            } else {
                performSegue(withIdentifier: "Score", sender: self)
            }
        } else if let guessed = guess.text, !guessed.isEmpty {
            explaining = true

            let answer = "\(number * questions[current])"
            
            if (current == 11) {
                checkContinueButton.setTitle("finish", for: .normal)
            } else {
                checkContinueButton.setTitle("continue", for: .normal)
            }

            if guessed == answer {
                correct += 1
                question.text = wellDones[Int(arc4random_uniform(UInt32(wellDones.count)))]
            } else {
                question.text = ohNoes[Int(arc4random_uniform(UInt32(ohNoes.count)))] + " the answer was: " + answer
            }
        }
    }

    // MARK - UITextFieldDelegate

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        checkAnswer()
        return true
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "Score") {
            let vc = segue.destination as! ScoreViewController
            vc.score = correct
        }
    }

}
