//
//  HomeViewController.swift
//  TimesTablesTest
//
//  Created by Ian Fleeton on 16/12/2017.
//  Copyright © 2017 Ian Fleeton. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func numberTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "StartTest", sender: sender)
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let sender = sender as? UIButton {
            let number = Int(sender.title(for: .normal)!)!
            let vc = segue.destination as! TimesTablesViewController
            vc.number = number
        }
    }

}
