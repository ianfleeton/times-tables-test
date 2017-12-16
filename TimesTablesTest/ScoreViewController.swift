//
//  ScoreViewController.swift
//  TimesTablesTest
//
//  Created by Ian Fleeton on 16/12/2017.
//  Copyright © 2017 Ian Fleeton. All rights reserved.
//

import UIKit

class ScoreViewController: UIViewController {
    @IBOutlet var scoreLabel: UILabel!
    var score = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scoreLabel.text = "You got \(score) right"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func startAgainTapped(_ sender: Any) {
        performSegue(withIdentifier: "UnwindToHome", sender: self)
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
