//
//  TimesTablesViewController.swift
//  TimesTablesTest
//
//  Created by Ian Fleeton on 16/12/2017.
//  Copyright © 2017 Ian Fleeton. All rights reserved.
//

import UIKit

class TimesTablesViewController: UIViewController {
    var number = 0
    @IBOutlet var question: UILabel!
    @IBOutlet var guess: UITextField!
    @IBOutlet var checkContinueButton: UIButton!
    var questions: [Int] = []
    var current = 0
    var correct = 0
    var explaining = false
    
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
    
    @IBAction func checkTapped(_ sender: Any) {
        if (explaining) {
            explaining = false

            checkContinueButton.setTitle("check", for: .normal)
            if (current < 11) {
                current += 1
                setQuestion()
            }
        } else {
            explaining = true

            let answer = "\(number * questions[current])"
            let guessed = guess.text!
            
            checkContinueButton.setTitle("continue", for: .normal)

            if guessed == answer {
                correct += 1
                question.text = "correct! you're awesome"
            } else {
                question.text = "oh no! the answer was: " + answer
            }
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
